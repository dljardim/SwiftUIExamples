//
//  Extensions.swift
//  SwiftUIExamples
//
//  Created by Damian Jardim on 4/3/25.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hexSanitized = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&int)
        
        let r, g, b: Double
        let a: Double
        
        switch hexSanitized.count {
            case 6: // RGB (no alpha)
                r = Double((int >> 16) & 0xFF) / 255
                g = Double((int >> 8) & 0xFF) / 255
                b = Double(int & 0xFF) / 255
                a = 1.0
            case 8: // RGBA
                r = Double((int >> 24) & 0xFF) / 255
                g = Double((int >> 16) & 0xFF) / 255
                b = Double((int >> 8) & 0xFF) / 255
                a = Double(int & 0xFF) / 255
            default:
                r = 0; g = 0; b = 0; a = 1
        }
        
        self.init(red: r, green: g, blue: b, opacity: a)
    }
}
