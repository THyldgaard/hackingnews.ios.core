//
//  Router.swift
//  hackingnews.ios.core
//
//  Created by Tonni Hyldgaard on 14/07/2025.
//

import Combine
import SwiftUI

@MainActor
public final class Router: ObservableObject {
    
    @Published public var navPath = NavigationPath()

    public init() {}
    
    public func navigate(to destination: Route) {
        navPath.append(destination)
    }
    
    public func navigateBack() {
        guard navPath.count > 0 else { return }
        navPath.removeLast()
    }
    
    public func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
    
    // Alternative async methods if you need to call from non-MainActor contexts
    nonisolated public func navigateAsync(to destination: Route) {
        Task { @MainActor in
            navigate(to: destination)
        }
    }
    
    nonisolated public func navigateBackAsync() {
        Task { @MainActor in
            navigateBack()
        }
    }
    
    nonisolated public func navigateToRootAsync() {
        Task { @MainActor in
            navigateToRoot()
        }
    }
}
