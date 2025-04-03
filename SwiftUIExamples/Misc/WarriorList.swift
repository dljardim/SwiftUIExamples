//
//  WarriorList.swift
//  SwiftUIExamples
//
//  Created by Damian Jardim on 3/24/25.
//

import SwiftUI
/*
 

struct WarriorList: View {
    @State private var warriors = ["Arthur", "Lancelot", "Merlin", "Gawain"]
    
    var body: some View {
        List {
            ForEach(warriors, id: \.self) { warrior in
                Text(warrior)
            }
            .onDelete(perform: deleteWarriors)
        }
    }
    
    func deleteWarriors(at offsets: IndexSet) {
        warriors.remove(atOffsets: offsets)
    }
}

struct MagicItemsList: View {
    @State private var items = ["Wand", "Potion", "Crystal Ball", "Spell Book"]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                Text(item)
            }
            .onDelete(perform: deleteItems)
        }
    }
    
    // Index sets
    func deleteItems(at offsets: IndexSet){
        items.remove(atOffsets: offsets)
    }
}

/* Modify the code below so that only spells with "Dark" in their name get deleted when swiping to delete */
struct SpellBook_old: View {
    @State private var spells:[String] = ["Fireball", "Dark Mist", "Lightning Strike", "Dark Curse", "Healing Light"]
    
    var body: some View {
        List {
            ForEach(spells, id: \.self) { spell in
                Text(spell)
            }
            .onDelete(perform: deleteSpells)
        }
    }
    
    func deleteSpells(at offsets: IndexSet) {
        spells.remove(atOffsets: offsets)
    }
}
 
 */




struct WarriorList_Previews: PreviewProvider {
    static var previews: some View {
        SpellBook()
    }
}


