//
//  Route.swift
//  hackingnews.ios.core
//
//  Created by Tonni Hyldgaard on 14/07/2025.
//

import Foundation

public enum Route {
    case news
    case author(id: String)
}


// MARK: Conform to Hashable
extension Route: Hashable {
    public static func == (lhs: Route, rhs: Route) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .news: break
        case .author(let authorId): hasher.combine(authorId)
        }
    }
}
