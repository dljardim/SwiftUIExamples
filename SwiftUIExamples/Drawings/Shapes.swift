//
//  Shapes.swift
//  SwiftUIExamples
//
//  Created by Damian Jardim on 4/2/25.
//

import SwiftUI

/*
 
 challenge -
 A red circle
 A blue rectangle
 A green capsule
 
 Add explicit frame sizes – Right now, the shapes will take up whatever space is available. Try specifying sizes to control their appearance.
 
 Add stroke borders – Experiment with .stroke(_:) to add outlines.
 Add rounded corners to the rectangle – Use .cornerRadius(_) for variation.
 Improve spacing – Try .frame(width: height:) to make them more visually distinct.
 
 Make the RedCircle exactly 100x100 pixels.
 Give the BlueRectangle a width of 150 and height of 80, with rounded corners (hint: .cornerRadius(_)).
 Add a 5-pixel white stroke around the GreenCapsule while keeping the fill color green.
 
*/
extension Challenge1{
    struct Shapes: View {
        
        var body: some View {
            ZStack{
                LinearGradient(
                    colors: [.blue, .purple, .orange],  // 🌅 Sunset colors!
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()  // Covers the whole screen
                                    //            Rectangle().foregroundColor(.black).ignoresSafeArea()
                VStack{
                    RedCircle()
                    
                    HStack(spacing: 20.0){
                        BlueRectangle()
                        GreenCapsule()
                    }
                    
                }.padding()
            }
        }
    }
    
    
    struct RedCircle: View {
        var body: some View {
            Circle().fill(.red.gradient)
                .frame(
                    width: 100,
                    height: 100
                )
        }
    }
    
    struct BlueRectangle: View {
        var body: some View {
            Rectangle().fill(.blue.gradient)
                .frame(width: 150, height:80).cornerRadius(10)
            LinearGradient(gradient: Gradient(colors: [.black, .gray]), startPoint: .top, endPoint: .bottom)
            
            
        }
    }
    
    struct GreenCapsule: View {
        var body: some View {
            Capsule()
                .fill(.green.gradient)
            //            .stroke(Color.orange,lineWidth: 5)
                .overlay(Capsule().stroke(Color.white, lineWidth: 5))
            
        }
    }
}
        
        
    
    
    #Preview {
        Challenge1.Shapes()
    }


/*
 
 shapes : cgrect
 top left -> bottom right
 bottom left -> top right
 */
