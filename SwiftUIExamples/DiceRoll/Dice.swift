//
//  Dice.swift
//  SwiftUIExamples
//
//  Created by Damian Jardim on 4/2/25.
//

import SwiftUI

struct Dice: View {
    
    let diceMaxValue:Int = 6
    let diceMinValue:Int = 1
    @State var diceValue:Int = 1
    
    func rollDice(){
        diceValue = Int.random(in: 1...6)
    }
    
    func displayFaceForValue(diceValue:Int){
        Text("\(diceValue)")
    }
    

    var body: some View {
        VStack{
            Rectangle()
        }.padding()
        
//    
    }
}

#Preview {
    Dice()
}
