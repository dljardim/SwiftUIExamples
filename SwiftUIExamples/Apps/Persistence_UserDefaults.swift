//
//  Persistence_UserDefaults.swift
//  SwiftUIExamples
//
//  Created by Damian Jardim on 3/10/25.
//

import SwiftUI

struct Persistence_UserDefaults: View {
    
    @State private var favoriteBook = ""

    var body: some View {
        
        VStack{
            
            TextField("Enter your favorite book", text: $favoriteBook)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Save"){
                UserDefaults.standard.set(favoriteBook, forKey: "favoriteBook")
            }
            
            Text("Your favorite book is: \(favoriteBook)")
                .padding()
            
        }
        .padding()
        .onAppear{
            if let savedBook = UserDefaults.standard.string(forKey: "favoriteBook"){
                favoriteBook = savedBook
            }
        }

    }
}

struct Persistence_UserDefaults_Previews: PreviewProvider {
    static var previews: some View {
        Persistence_UserDefaults()
    }
}
