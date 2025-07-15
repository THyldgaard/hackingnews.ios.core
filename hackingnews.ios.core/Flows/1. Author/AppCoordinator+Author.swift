//
//  AppCoordinator+Author.swift
//  hackingnews.ios.core
//
//  Created by Tonni Hyldgaard on 15/07/2025.
//

import SwiftUI
extension AppCoordinator {
    
    @ViewBuilder
    func makeAuthorFlow(by id: String) -> AuthorView {
        AuthorView(dependencies: dependencies, id: id)
    }
    
}
