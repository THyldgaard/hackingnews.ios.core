//
//  NewsViewModel.swift
//  hackingnews.ios.core
//
//  Created by Tonni Hyldgaard on 15/07/2025.
//

import Combine
import Foundation

class NewsViewModel: ObservableObject {
    typealias Dependencies = HasDataProvidable
    
    @Published var stories: [Story] = []
    
    let dependencies: Dependencies
    var router: Router?
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func fetchNews() async {
        do {
            stories = try await dependencies.dataProvider.loadStories()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func refreshNews() async {
        do {
            stories = try await dependencies.dataProvider.refreshStories()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func goToAuthor(id: String) {
        self.router?.navigate(to: .author(id: id))
    }
    
}
