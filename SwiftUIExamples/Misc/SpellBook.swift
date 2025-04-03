//
//  SpellBook.swift
//  SwiftUIExamples
//
//  Created by Damian Jardim on 3/24/25.
//

import SwiftUI

/*
struct SpellBook: View {
    @State private var spells = ["Fireball", "Dark Mist", "Lightning Strike", "Dark Curse", "Healing Light"]
    
    var body: some View {
        
        Text("SpellBook.swift")
        
        List {
            ForEach(spells, id: \.self) { spell in
                Text(spell)
            }
            .onDelete(perform: deleteSpells)
        }
    }
    
    func deleteSpells(at offsets: IndexSet) {
        
        let validOffsets = offsets.intersection(IndexSet(spells.indices.filter { spells[$0].contains("Dark") }))

        
        spells.remove(atOffsets: IndexSet(validOffsets)) // Delete only valid ones
    }

}
*/

/* swipe actions can be used for list deletion */
struct SpellBook: View {
    @State private var spells = ["Fireball", "Dark Mist", "Lightning Strike", "Dark Curse", "Healing Light"]
    
    var body: some View {
        List {
            ForEach(spells, id: \.self) { spell in
                Text(spell)
                    .swipeActions {
                        if spell.contains("Dark") { // Only show delete for "Dark" spells
                            Button(role: .destructive) {
                                deleteSpell(spell)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
            }
        }
    }
    
    func deleteSpell(_ spell: String) {
        if let index = spells.firstIndex(of: spell) {
            spells.remove(at: index)
        }
    }
}


#Preview {
    SpellBook()
}
