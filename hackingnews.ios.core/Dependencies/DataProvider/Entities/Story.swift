//
//  Story.swift
//  hackingnews.ios.core
//
//  Created by Tonni Hyldgaard on 14/07/2025.
//

import Foundation

struct Story: Codable, Hashable {
    let id: Int
    let title: String
    let by: String
    let text: String?
    let url: String?
    let score: Int
    let time: Int
    let type: String
    let descendants: Int
}
