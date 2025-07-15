//
//  NewsView.swift
//  hackingnews.ios.core
//
//  Created by Tonni Hyldgaard on 15/07/2025.
//

import SwiftUI

struct NewsView: View {
    
    @EnvironmentObject var router: Router
    @StateObject private var viewModel: NewsViewModel
    
    init(dependencies: NewsViewModel.Dependencies) {
        _viewModel = StateObject(
            wrappedValue: NewsViewModel(
                dependencies: dependencies
            )
        )
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.stories, id: \.id) { story in
                VStack(alignment: .leading) {
                    HStack {
                        Text(story.title)
                            .font(.body)
                            .bold()
                            .foregroundStyle(.primary)
                        
                        Spacer()
                        
                        Text(story.score.description)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    
                    Button(
                        action: {
                            viewModel.goToAuthor(id: story.by)
                        },
                        label: {
                            Text(story.by)
                                .font(.subheadline)
                                .underline(true)
                                .foregroundStyle(.secondary)
                        }
                    )
                    
                    if let text = story.text {
                        Text(text)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .lineLimit(2)
                            .padding(.top, 4)
                    }
                    
//                    if let url = URL(string: story.url ?? "https://www.google.com") {
//                        Link("Read more", destination: url)
//                            .padding([.top, .bottom], 4)
//                    }
                }
            }
            .navigationTitle("Hacking News")
            .refreshable {
                await viewModel.refreshNews()
            }
            .onAppear {
                viewModel.router = router
                Task {
                    await viewModel.fetchNews()
                }
            }
        }
        .background(Color.red)
    }
}
