//
//  Environment.swift
//  MultiEnvironment
//
//  Created by Kwame Agyenim Boateng on 8/12/23.
//

import Foundation


enum Environment: String {
    case debugDevelopment = "Debug Development"
    case releaseDevelopment = "Release Development"
    
    case debugStaging = "Debug Staging"
    case releaseStaging = "Release Staging"
        
    case debugProduction = "Debug Production"
    case releaseProduction = "Release Production"
}
