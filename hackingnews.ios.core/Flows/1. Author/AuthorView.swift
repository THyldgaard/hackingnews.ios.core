//
//  AuthorView.swift
//  hackingnews.ios.core
//
//  Created by Tonni Hyldgaard on 15/07/2025.
//

import SwiftUI

struct AuthorView: View {
    
    @EnvironmentObject var router: Router
    @StateObject private var viewModel: AuthorViewModel
    private let id: String
    
    init(dependencies: AuthorViewModel.Dependencies, id: String) {
        _viewModel = StateObject(
            wrappedValue: AuthorViewModel(
                dependencies: dependencies
            )
        )
        self.id = id
    }
    
    var body: some View {
        NavigationView {
            switch viewModel.state {
            case .loading:
                Text("Loading...")
            case .loaded:
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        if let name: String = viewModel.author?.id {
                            Text(name)
                                .font(.body)
                                .bold()
                                .foregroundStyle(.primary)
                        }
                        
                        Spacer()
                        
                        if let karma: Int = viewModel.author?.karma {
                            Text(karma.description)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                    
                    if let about = viewModel.author?.about {
                        Text(about)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    
                    if let articleCount: Int = viewModel.author?.submitted.count {
                        Text(articleCount.description)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
        .navigationTitle("Author")
        .onAppear {
            viewModel.router = router
            Task {
                await viewModel.fetchAuthor(by: id)
                
            }
        }
    }
}
