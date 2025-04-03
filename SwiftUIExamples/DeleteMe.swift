//
//  DeleteMe.swift
//  SwiftUIExamples
//
//  Created by Damian Jardim on 3/14/25.
//

import SwiftUI

struct PizzaOrder: Codable {
    var size: String
    var toppings: [String]
    var quantity: Int
}

struct DeleteMeExampl1: View {
    
    let jsonString = """
    {
        "size": "medium",
        "toppings": ["mushrooms", "olives"],
        "amount": 2
    }
    """
    
    
    var body: some View {
        VStack{
            Button{
                let order = PizzaOrder(size: "medium", toppings: ["mushrooms", "olives"], quantity: 2)
                let encoder = JSONEncoder()
                if let jsonData = try? encoder.encode(order),
                   let jsonString = String(data: jsonData, encoding: .utf8) {
                    print("Encoded JSON:", jsonString)
                }
            }label:{
                Text("encode")
            }
            
            Button{
                let jsonData = jsonString.data(using: .utf8)!
                let decoder = JSONDecoder()
                if let decodedOrder = try? decoder.decode(PizzaOrder.self, from: jsonData) {
                    print("Decoded Order:", decodedOrder)
                }
            }label:{
                Text("decode")
            }
        }
    }
}



struct DeleteMe_Previews: PreviewProvider {
    static var previews: some View {
        UserDefaultsJSON()
    }
}
