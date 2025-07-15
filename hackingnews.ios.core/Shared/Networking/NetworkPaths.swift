//
//  NetworkPaths.swift
//  hackingnews.ios.core
//
//  Created by Tonni Hyldgaard on 15/07/2025.
//

import Foundation

final class NetworkPaths {
    let baseURL: StaticString = "http://127.0.0.1:3000"

    var storiesPath: StaticString = "/stories"
    var refreshStoriesPath: StaticString = "/refresh"
    
    private var authorPath: StaticString = "/author"
    
    init() {}
    
    func authorPath(by id: String) -> String {
        authorPath.description + "/\(id)"
    }
}
