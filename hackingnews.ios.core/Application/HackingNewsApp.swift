//
//  HackingNewsAppApp.swift
//  hackingnews.ios.core
//
//  Created by Tonni Hyldgaard on 14/07/2025.
//

import SwiftUI

@main
struct HackingNewsApp: App {
    
    var body: some Scene {
        WindowGroup {
            RootView(dependencies: makeDependencies())
        }
    }
    
    private func makeDependencies() -> AppDependencyType {
        let networkManager = NetworkManager.shared
        let dataProvider: DataProvidable = DataProvider(networkManager: networkManager)
        
        return AppDependencies(dataProvider: dataProvider)
    }
}
