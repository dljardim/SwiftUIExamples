//
//  PCCounterView.swift
//  SwiftUIExamples
//
//  Created by Damian Jardim on 3/3/25.
//

import SwiftUI

struct PCParentView: View{
    
    @State private var parentCount: Int = 0
    
    var body: some View {
        VStack {
            
            Text("PCParentView - Count: \(parentCount)")
            
            PCCounterView(childCount: $parentCount)
            
           
        }
    }
}

struct PCCounterView: View {
    @Binding var childCount: Int
    
    var body: some View {
        Text("PCCounterView")
        
        Text("PCCounterView - Count: \(childCount)")
        
        Button("increase"){
            childCount += 1
        }
        
        Button("decrease"){
            childCount -= 1
        }
    }
}


#Preview {
    PCParentView()
}
