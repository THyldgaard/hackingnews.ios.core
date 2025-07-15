//
//  NetworkManager.swift
//  hackingnews.ios.core
//
//  Created by Tonni Hyldgaard on 15/07/2025.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private let paths: NetworkPaths = .init()
    
    init() {}

    private func fetch<T: Decodable>(from endpoint: String) async throws -> T {
        guard let url = URL(string: "\(paths.baseURL)\(endpoint)") else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        print(try JSONDecoder().decode(T.self, from: data))
        return try JSONDecoder().decode(T.self, from: data)
    }

    // MARK: - Endpoints

    func getStories() async throws -> [Story] {
        try await fetch(from: paths.storiesPath.description)
    }

    func refreshStories() async throws -> [Story] {
        try await fetch(from: paths.refreshStoriesPath.description)
    }

    func getAuthor(id: String) async throws -> Author {
        try await fetch(from: paths.authorPath(by: id))
    }
}
