//
//  PersistenceTabView.swift
//  SwiftUIExamples
//
//  Created by Damian Jardim on 3/12/25.
//

import SwiftUI

struct PersistenceTabView: View {
    var body: some View {
        TabView{
            Tab("User Defaults", systemImage: "house.circle"){
                PersistenceExamples_Strings()
            }
            Tab("Intermediate", systemImage: "circle.circle"){
                Persistence_UserDefaults()
            }
            Tab("Expert", systemImage: "square.circle"){
                Text("Expert stuff goes here")
            }
        }
        .tabViewStyle(.automatic)
        .animation(.bouncy(extraBounce: 2.2), value: 0.2)
    }
}

#Preview {
    PersistenceTabView()
}
