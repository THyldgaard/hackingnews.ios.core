//
//  RootView.swift
//  hackingnews.ios.core
//
//  Created by Tonni Hyldgaard on 14/07/2025.
//

import SwiftUI

struct RootView: View {
    
    @ObservedObject var router: Router = .init()
    @StateObject private var appCoordinator: AppCoordinator
    
    init() {
        _appCoordinator = StateObject(wrappedValue: AppCoordinator())
    }
    
    var body: some View {
        NavigationStack(path: $router.navPath) {
            
        }
        .environmentObject(router)
    }
    
    @ViewBuilder
    private func getInitialView() -> some View {
        var initialRoute: Route {
            appCoordinator.start()
        }
    }
    
    @ViewBuilder
    private func getView(for route: Route) -> some View {
        switch route {
        case .news:
            EmptyView()
        case .auther:
            EmptyView()
        }
    }
}

#Preview {
    RootView()
}
