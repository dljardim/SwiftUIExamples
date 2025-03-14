//
//  OptionalsLetGuard.swift
//  SwiftUIExamples
//
//  Created by Damian Jardim on 3/12/25.
//

import SwiftUI

struct OptionalsLetGuard: View {
    
    var treasure: String? = nil
    
    var body: some View {
        Text("OptionalsLetGuard.swift")
    }
}

struct TreasureViewExamples: View {
    var treasure: String? = nil
    
    var computedPropertyTreasure:String {
        return treasure ?? "nada"
    }
    
    var body: some View {
        
        // if let
        if let ilTreasure = treasure {
            Text("You found: \(ilTreasure)")
        }else{
            Text("treasure was nil")
        }
        
        // nil coalecse
        Text("You found: \(treasure ?? "nothing")")
        
        Text("You found: \(computedPropertyTreasure)")
        
    }
}




struct GuardLetTreasureView:View{
    
    @State private var secretMessage:String = "Tap the button"
    
    func readSecretMessage()->String {
        let secretMessage: String? = "The password is 'password'"
        
        guard let glSecretMessage = secretMessage else {
            return "No message found!"
        }
        return "The message says: \(glSecretMessage)"
    }
    
    func getSecretMessage(){
        secretMessage = readSecretMessage()
    }
    
    var body: some View {
        VStack(spacing: 20){
            Button("get secret message"){
                getSecretMessage()
            }.buttonStyle(.borderedProminent)
            
            Text(secretMessage)
        }
    }
}


/*
 1. treasure array has a nil value.  randomElement() has the possibility of returning nil.
 The TreasureView forces the unwrap without dealing with a nil value
 
 */

func findTreasure() -> String? {
    let treasures: [String?] = ["Gold Coin", "Ancient Sword", "Magic Ring", nil]
    guard let element = treasures.randomElement() else {return ""}
    
    return element
}

struct TreasureView: View {
    
    @State private var treasure = "Tap the button to search!"
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("🪙 \(treasure)")
                .padding()
            
            Button("Find Treasure") {
                if let ilTreasure = findTreasure() {
                    treasure = "You found: \(ilTreasure)!"
                } else {
                    treasure = "No treasure found! 😢"
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}



#Preview {
    TreasureView()
}
