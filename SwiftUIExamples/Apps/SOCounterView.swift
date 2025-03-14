//
//  SOCounterView.swift
//  SwiftUIExamples
//
//  Created by Damian Jardim on 3/3/25.
//

import SwiftUI


//
//class SOCounterModel: ObservableObject{
//    @Published var count = 0
//}


class SOCounterModel: ObservableObject{
    @Published var count:Int = 0
}

struct SOParentView: View {
    
    @StateObject private var soCounterModel:SOCounterModel = SOCounterModel()
    
    var body: some View{
        VStack{
            Text("SoParentView")
            Text("Parent Count: \(soCounterModel.count)")
            SOChildView(soCounterModel: soCounterModel)
        }
    }
}

struct SOChildView: View {
    
    @ObservedObject var soCounterModel: SOCounterModel

    var body: some View {
        
        VStack{
            Text("SOChildView")
            HStack{
                Button("increase"){
                    soCounterModel.count += 1
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
                
                Button("decrease"){
                    soCounterModel.count -= 1
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
        }
        
    }
}



#Preview {
    SOParentView()
}
