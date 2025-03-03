//
//  Person.swift
//  SwiftUIExamples
//
//  Created by Damian Jardim on 3/2/25.
//

import Foundation

struct Person: Codable, Identifiable{
    let id: UUID
    let name: String
    let age: Int
    let email: String
    let isActive: Bool
    
    static let _preview:[Person] = [
        Person(id: UUID(), name: "Ted", age: 30, email: "ted@gamil.com", isActive: true),
        Person(id: UUID(), name: "Richard", age: 85, email: "richard@gamil.com", isActive: true),
        Person(id: UUID(), name: "Katie", age: 55, email: "katie@gamil.com", isActive: false),
        Person(id: UUID(), name: "Paul", age: 10, email: "paul@gamil.com", isActive: true),
        Person(id: UUID(), name: "Vamp", age: 669, email: "vamp@gamil.com", isActive: true),
    ];
}




