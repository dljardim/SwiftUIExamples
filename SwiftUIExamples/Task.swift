//
//  task.swift
//  SwiftUIExamples
//
//  Created by Damian Jardim on 3/2/25.
//

import Foundation

struct Task: Identifiable, Codable{
    let id: Int
    let title: String
    var isCompleted: Bool
}
