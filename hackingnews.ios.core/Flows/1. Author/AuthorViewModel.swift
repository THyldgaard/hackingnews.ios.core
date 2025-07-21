//
//  AuthorViewModel.swift
//  hackingnews.ios.core
//
//  Created by Tonni Hyldgaard on 15/07/2025.
//

import Combine
import Foundation

class AuthorViewModel: ObservableObject {
    typealias Dependencies = HasDataProvidable
    
    enum ViewState {
        case loading
        case loaded
    }
    
    @Published var state: ViewState = .loading
    @Published var author: Author?
    
    private let dependencies: Dependencies
    var router: Router?
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func fetchAuthor(by id: String) async {
        do {
            author = try await dependencies.dataProvider.getAuthor(by: id)
            state = .loaded
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
