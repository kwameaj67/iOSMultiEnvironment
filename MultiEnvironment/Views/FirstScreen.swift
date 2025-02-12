//
//  FirstScreen.swift
//  MultiEnvironment
//
//  Created by Kwame on 12/02/2025.
//

import SwiftUI

struct FirstScreen: View {
    @EnvironmentObject var navigator: UINavigationController
    @Binding var number: Int
    var body: some View {
        Form {
            Button("next screen present"){
                navigator.present(route: .secondScreen(number: number))
            }
            Button("next screen push"){
                navigator.navigateTo(route: .secondScreen(number: number))
            }
        }
        .navigationTitle("first view")
    }
}

#Preview {
    FirstScreen(number: .constant(0))
}
