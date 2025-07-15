//
//  AppCoordinator+News.swift
//  hackingnews.ios.core
//
//  Created by Tonni Hyldgaard on 15/07/2025.
//

import SwiftUI

extension AppCoordinator {
    
    @ViewBuilder
    func makeNewsFlow() -> NewsView {
        NewsView(dependencies: dependencies)
    }
    
}
