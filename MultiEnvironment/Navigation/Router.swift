//
//  Router.swift
//  MultiEnvironment
//
//  Created by Kwame on 12/02/2025.
//

import SwiftUI

protocol Router {
    associatedtype V: View
    
    @ViewBuilder
    func view() -> V
    var identifier: String { get } 
}
