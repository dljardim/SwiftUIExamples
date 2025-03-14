//
//  ExCounterView.swift
//  SwiftUIExamples
//
//  Created by Damian Jardim on 3/3/25.
//
import SwiftUI

struct ExParentView: View {
    @State private var count = 0
    
    var body: some View {
        VStack {
            Text("Parent Count: \(count)")
                .font(.largeTitle)
            ExCounterView(count: $count)
        }
    }
}

struct ExCounterView: View {
    @Binding var count: Int
    
    var body: some View {
        Button("Increase") {
            count += 1
        }
    }
}

#Preview {
    ExParentView()
}
