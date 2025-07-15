//
//  DataProvidable.swift
//  hackingnews.ios.core
//
//  Created by Tonni Hyldgaard on 14/07/2025.
//

import Foundation

protocol DataProvidable {
    func loadStories() async throws -> [Story]
    func refreshStories() async throws  -> [Story]
    func getAuthor(by id: String) async throws -> Author
}
