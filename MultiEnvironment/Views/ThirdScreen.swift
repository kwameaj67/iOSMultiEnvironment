//
//  ThirdScreen.swift
//  MultiEnvironment
//
//  Created by Kwame on 12/02/2025.
//

import SwiftUI

struct ThirdScreen: View {
    @EnvironmentObject var navigator: UINavigationController
    @Binding var number: Int
    
    var body: some View {
        Form {
            Text("Second Screen \(number)")
            Button("dismiss"){
                navigator.dismiss()
            }
            Button("pop"){
                navigator.pop()
            }
            Button("pop till"){
                navigator.popTo(route: .firstScreen(number: number + 1))
            }
            Button("pop to root"){
                navigator.popToRoot()
            }
        }.navigationTitle("third screen")
    }
}

#Preview {
    ThirdScreen(number: .constant(0))
}
