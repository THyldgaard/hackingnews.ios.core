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
    
    init(dependencies: AppDependencyType) {
        _appCoordinator = StateObject(
            wrappedValue: AppCoordinator(
                dependencies: dependencies
            )
        )
    }
    
    var body: some View {
        NavigationStack(path: $router.navPath) {
            getInitialView()
                .navigationDestination(for: Route.self) { route in
                    getView(for: route)
                }
        }
        .background(Color.blue)
        .environmentObject(router)
    }
    
    @ViewBuilder
    private func getInitialView() -> some View {
        var initialRoute: Route {
            appCoordinator.start(with: .news)
        }
        
        getView(for: initialRoute)
    }
    
    @ViewBuilder
    private func getView(for route: Route) -> some View {
        switch route {
        case .news:
            appCoordinator.makeNewsFlow()
        case .author:
            EmptyView()
        }
    }
}

#Preview {
    let dependencies: AppDependencyType = AppDependencies(dataProvider: DataProvider(networkManager: NetworkManager()))
    RootView(dependencies: dependencies)
}
