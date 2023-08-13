//
//  BuildConfiguration.swift
//  MultiEnvironment
//
//  Created by Kwame Agyenim Boateng on 8/12/23.
//

import Foundation

class BuildConfiguration {
    static let shared = BuildConfiguration()
    
    var environment: Environment
    
    var baseURL: String {
        switch environment {
        case .debugDevelopment, .releaseDevelopment:
            return "https://dev.example.com/api"
        case .debugStaging, .releaseStaging:
            return "https://staging.example.com/api"
        case .debugProduction, .releaseProduction:
            return "https://example.com/api"
        }
    }
    
    init() {
        let currentConfiguration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as! String
        environment = Environment(rawValue: currentConfiguration)!
    }
}
