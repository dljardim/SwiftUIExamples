//
//  Counter.swift
//  SwiftUIExamples
//
//  Created by Damian Jardim on 3/3/25.
//

import SwiftUI

class CounterViewModel: ObservableObject{
    @Published var count = 0
    
    func increase(){
        count += 1
    }
    
    func decrease(){
        count -= 1
    }
}

struct CounterView: View {
    @StateObject private var counterViewModel: CounterViewModel = CounterViewModel()
    
    var body: some View {
        Text("Count: \(counterViewModel.count)")
            .font(.title)
        
        
        HStack{
            Button("Increase"){
                counterViewModel.increase()
            }.buttonStyle(.borderedProminent)
            
            Button("Decrease"){
                counterViewModel.decrease()
            }.buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    CounterView()
}


/*
 
 Questions:
 Why doesn’t count update when tapping the button?
 structs are immutable in swift. We need to use @State or @StateObjects to reatain their values.
 
 CounterView view is recreated every time the view updates
 ---
 How would you fix it? (Modify the code)
 ---
 What happens if you replace @State with let?
  - let marks the variable as a constant - error
  - removing @State means the count will not be retained
 
 ---
 🧠 Mini Quiz (No Code Yet—Just Answer)
 What happens if you remove @State but keep var count = 0 instead of let?
 -  Count will be recreated to 0 every time the view updates menaing "Count: 0" will always be displayed
 
 Why is @State private instead of @State public?
 private restricts access to the variable to only this view.
 
 If we want to modify count from another view, what should we use instead of @State?
 @StateObject
 ObserableObject protocol
 @Published var count
 
 mvvm where our mo
 add ObservableObject
 
 
 */
