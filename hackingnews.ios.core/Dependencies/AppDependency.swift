//
//  AppDependency.swift
//  hackingnews.ios.core
//
//  Created by Tonni Hyldgaard on 14/07/2025.
//

protocol AppDependencyType: HasDataProvidable {}

struct AppDependencies: AppDependencyType {
    let dataProvider: DataProvidable
    
    init(dataProvider: DataProvidable) {
        self.dataProvider = dataProvider
    }
}

protocol HasDataProvidable {
    var dataProvider: DataProvidable { get }
}
