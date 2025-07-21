//
//  AppCoordinator.swift
//  hackingnews.ios.core
//
//  Created by Tonni Hyldgaard on 14/07/2025.
//

import Combine
import SwiftUI

final class AppCoordinator: ObservableObject {
    
    internal var dependencies: AppDependencyType
    
    init(dependencies: AppDependencyType) {
        self.dependencies = dependencies
    }
    
    func start(with route: Route? = nil) -> Route {
        guard let route else { return .news }
        return route
    }
}
