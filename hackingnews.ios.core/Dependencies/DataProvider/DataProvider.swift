//
//  DataProvider.swift
//  hackingnews.ios.core
//
//  Created by Tonni Hyldgaard on 14/07/2025.
//

import Foundation

final class DataProvider: DataProvidable {
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func loadStories() async throws -> [Story] {
        try await networkManager.getStories()
    }
    
    func refreshStories() async throws -> [Story] {
        try await networkManager.refreshStories()
    }
    
    func getAuthor(by id: String) async throws -> Author {
        try await networkManager.getAuthor(id: id)
    }
    
}
