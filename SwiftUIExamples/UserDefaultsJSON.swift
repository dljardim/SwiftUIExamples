//
//  UserDefaultsJSON.swift
//  SwiftUIExamples
//
//  Created by Damian Jardim on 3/14/25.
//

import SwiftUI

struct Product:Codable{
    let name: String
    let savedAt: Date
}

struct Pizza:Codable{
    let size:String
    let toppings:[String]
    let quantity:Int
}

struct UserDefaultsJSON: View {
    
    let jsonData = """
    {
        "size": "large",
        "toppings": ["cheese", "pepperoni"],
        "quantity": 1
    }
    """.data(using: .utf8)!
    
    
    let myPizza = Pizza(size: "Big", toppings: ["cheese", "pepperoni"], quantity: 1)
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    var body: some View {
        VStack(spacing:10){
            Text("UserDefaultsJSON")

            Button{
                // encode
                if let jsonData = try? encoder.encode(myPizza),
                   let jsonString = String(data: jsonData, encoding: .utf8) {
                    print(jsonString)
                }
                
            }label:{
                Text("Encode")
            }.buttonStyle(.borderedProminent).tint(.red)
            
            Button{
                if let decodedPizza = try? decoder.decode(Pizza.self, from: jsonData){
                    print(decodedPizza)
                }
            }label:{
                Text("Decode")
            }.buttonStyle(.borderedProminent)
            
        }.padding()// vstack
    }
}


struct UserDefaultsJSON_Previews: PreviewProvider {
    static var previews: some View {
        UserDefaultsJSON()
    }
}

/*
 
 structs should 
 
 */
