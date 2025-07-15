//
//  Author.swift
//  hackingnews.ios.core
//
//  Created by Tonni Hyldgaard on 14/07/2025.
//

import Foundation

struct Author: Codable, Hashable {
    let id: String
    let about: String?
    let created: Int
    let karma: Int
    let submitted: [Int]
}
