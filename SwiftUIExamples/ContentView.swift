//
//  ContentView.swift
//  SwiftUIExamples
//
//  Created by Damian Jardim on 3/1/25.
//

import SwiftUI


struct ContentView: View {
    @State private var people: [Person] = []
    
    var body: some View{
        NavigationStack{
            List{
                ForEach(people, id: \.self.id){ person in
                    Text("person: \(person.name)")
                }
            }
        }.onAppear(perform: loadData)
    }
    
    func loadData() {
        if let url = Bundle.main.url(forResource: "data", withExtension: "json") {
            if let data = try? Data(contentsOf: url) {
                let decoder = JSONDecoder()
                if let decodedData = try? decoder.decode([Person].self, from: data) {
                    people = decodedData
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/*
    What does @State private var people: [Person] = [] do in this code?
    Why do we use Bundle.main.url(forResource: "data", withExtension: "json") to load the JSON file?
    What would happen if the JSON file contained an extra field (e.g., email: "john@example.com") but our struct does not define it?
 
 1. @State private var people -  creates an empty array of Persons to state
 
 2. bundle represents resources at a specified location
    bundle.main = the app's resources
 
 3. adding a new field on an already existing and working content view , the extra field will not be shown on the view..  to add the  email field, it should be added to both the struct contentView, the json file, and the struct definition..
 
 ---------------
 
 What will happen if the JSON file is missing a required field (e.g., age is missing from one entry)?
    
- removing the age field (key and value) from data.json file will result in a blank screen
- removing the value only of age shows a blank screen.

 
 How to make
 
 
 
 
 
 
 
 */
