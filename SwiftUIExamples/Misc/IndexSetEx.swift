//
//  IndexSetEx.swift
//  SwiftUIExamples
//
//  Created by Damian Jardim on 3/24/25.
//

import SwiftUI

struct IndexSetEx: View {
    
    @State private var warriors = ["Arthur", "Lancelot", "Merlin", "Gawain"]
    
    var body: some View {
        ForEach(warriors, id:\.self){warrior in
            Text(warrior)
                .frame(width: 100.0, height: 50.0)
                .background(Color.red)
  
        }
        .onDelete(perform: deleteWarriors)
    }
    
    func deleteWarriors(at offsets: IndexSet){
        warriors.remove(atOffsets: offsets)
    }
}

#Preview {
    IndexSetEx()
}
