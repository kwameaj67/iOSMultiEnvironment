//
//  AppRoute.swift
//  MultiEnvironment
//
//  Created by Kwame on 12/02/2025.
//

import SwiftUI

enum AppRoute: Router {
    /// Route unique identifier
    var identifier: String {
        switch self {
        case .firstScreen(_): return "first_screen"
        case .secondScreen(_): return "second_screen"
        case .thirdScreen(_): return "third_screen"
        }
    }
    
    case firstScreen(number: Int)
    case secondScreen(number: Int)
    case thirdScreen(number: Int)
    
    /// Some View 
    func view() -> some View {
        switch self {
        case .firstScreen(let number):
            FirstScreen(number: .constant(number))
        case .secondScreen(let number):
            SecondScreen(number: .constant(number))
        case .thirdScreen(let number):
            ThirdScreen(number: .constant(number))
        }
    }
}


