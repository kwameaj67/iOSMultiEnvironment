//
//  SecondScreen.swift
//  MultiEnvironment
//
//  Created by Kwame on 12/02/2025.
//

import SwiftUI

struct SecondScreen: View {
    @EnvironmentObject var navigator: UINavigationController
    @Binding var number: Int
    
    var body: some View {
        Form {
            Text("Second Screen \(number)")
            Button("dismiss"){
                navigator.dismiss()
            }
            Button("next screen present"){
                navigator.present(route: .thirdScreen(number: number + 1))
            }
            Button("next screen push"){
                navigator.navigateTo(route: .thirdScreen(number: number + 1))
            }
            Button("pop to root"){
                navigator.popToRoot()
            }
        }
        .navigationTitle("second view")
    }
}

#Preview {
    SecondScreen(number: .constant(0))
}
