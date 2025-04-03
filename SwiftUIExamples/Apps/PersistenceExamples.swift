//
//  PersistenceExamples.swift
//  SwiftUIExamples
//
//  Created by Damian Jardim on 3/12/25.
//

import SwiftUI

struct PersistenceExamples_Strings: View {
    
    // bind to textfield
    @State private var savedValue: String = ""
    @State private var savedKey:String = ""
    
    func getSavedText()->String{
        return UserDefaults.standard.string(forKey: savedKey) ?? ""
    }
    func setSavedText(textToSave:String){
        UserDefaults.standard.set(savedValue, forKey: savedKey)
    }
    
    var body: some View {
        
        List{
            
            
            Section("SAVE"){
                TextField("Enter a value to save", text: $savedValue)
                
                Button{
                    setSavedText(textToSave: savedValue)
                }label:{
                    Text("Save To User Defaults")
                }
                .buttonStyle(.bordered)
            }
            
            
            Section("LOAD"){
                Text("Load from user defaults")
                    .foregroundColor(.secondary)
                    .opacity(0.7)
                    .font(.body)
                    .fontWeight(.regular)
                
                Button{
                    print(getSavedText())
                }label: {
                    Text("Load from User Defaults")
                }.buttonStyle(.borderedProminent)
            }
        }
        
    }
}


/*
 Exercise 1: Save and Load a Favorite Color
 
 Exercise: Write an app that allows a user to enter their favorite color, save it, and display it on the screen. When the user reopens the app, it should remember the color they chose.
 */

struct PersistenceExamples_FavoriteColorString: View{
    let favoriteKey = "favoriteColor"
    @State private var favoriteColor:String = ""
    @State private var resultColor:String = "No color saved"
    
    var body: some View {
        
        List{
            Section("SAVE"){
                TextField("Enter favorite color", text:$favoriteColor)
                    .autocorrectionDisabled(true)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Save"){
                    UserDefaults.standard.set(favoriteColor, forKey: favoriteKey)
                    resultColor = favoriteColor
                }
                .buttonStyle(.borderedProminent)
                
            }
            Section("LOAD"){
                Text("returned color: \(resultColor)")
                    .bold()
                    .foregroundStyle(.blue)
            }
        }
        .onAppear{
            resultColor = UserDefaults.standard.string(forKey: favoriteKey) ?? "No color saved"
        }
    }
}


/*
 Exercise 2: Save and Load a Favorite Color
 
 Modify this app so that when the user enters a color name (e.g., "red", "blue", "green"), the background of the Text displaying the color updates dynamically.
 
 - there was no built in functionality to go from a string to a Color, i created a func that takes a string parameter, uses a switch case, and returns a swiftui color
 */

func PersistenceExamples_FavoriteColorString2_getColor(name:String)->Color{
    let resultColor = switch name.lowercased() {
        case Color.white.description: Color.white
        case Color.black.description: Color.black
        case Color.clear.description: Color.clear
        case Color.blue.description: Color.blue
        case Color.red.description: Color.red
        case Color.green.description: Color.green
        default: Color.gray
    }
    return resultColor
}

struct PersistenceExamples_FavoriteColorString2: View {
    let favoriteKey = "favoriteColor"
    @State private var favoriteColor: String = ""
    @State private var resultColor: String = "No color saved"
    
    var body: some View {
        List {
            Section("SAVE") {
                TextField("Enter favorite color", text: $favoriteColor)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Save") {
                    UserDefaults.standard.set(favoriteColor, forKey: favoriteKey)
                    resultColor = favoriteColor // Update immediately
                }
                .buttonStyle(.borderedProminent)
            }
            
            Section("SAVED COLOR") {
                ZStack{
                    Text("Favorite color: \(resultColor)")
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                }.background(PersistenceExamples_FavoriteColorString2_getColor(name:resultColor))
                    .cornerRadius(8)
            }
            
            
            Text("Favorite color: \(resultColor)")
                .padding()
                .background(PersistenceExamples_FavoriteColorString2_getColor(name:resultColor)) // Apply the background color
                .foregroundColor(.white) // Ensure text is readable
                .cornerRadius(8)
        }
        .onAppear {
            resultColor = UserDefaults.standard.string(forKey: favoriteKey) ?? "No color saved"
        }
    }
}

/*************************/

func PersistenceExamples_FavoriteColorString3_getColor(name:String)->Color{
    let resultColor = switch name.lowercased() {
        case "red": Color.red
        case "white":  Color.white
        case "blue":  Color.blue
        default: Color.primary
    }
    return resultColor
}

struct PersistenceExamples_FavoriteColorString3: View {
    let favoriteKey = "favoriteColor"
    @State private var favoriteColor: String = ""
    @State private var resultColor: String = "No color saved"
    @State private var saveScale = 1.0
    
    var body: some View {
        List {
            Section("SAVE") {
                TextField("Enter favorite color", text: $favoriteColor)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Save") {
                    UserDefaults.standard.set(favoriteColor, forKey: favoriteKey)
                    resultColor = favoriteColor
                    withAnimation{
                        saveScale = 2.0
                    }

                    // directly within the button closure
//                    withAnimation{
//                    }
                }
                .buttonStyle(.borderedProminent)
                .scaleEffect()
              
            }
            
            // 2 options when changing the background color of a Text Field -
            // TEXT
            Section("TEXT BACKGROUND COLOR"){
                Text("Favorite color: \(resultColor)")
                    .padding()
                    .background(PersistenceExamples_FavoriteColorString2_getColor(name:resultColor)) // Apply the background color
                    .foregroundColor(.white) // Ensure text is readable
                    .cornerRadius(8)
                    .animation(.easeIn, value: 0.5)
            }
            // ZSTACK
            Section("ZSTACK BACKGROUND COLOR") {
                ZStack{
                    Text("Favorite color: \(resultColor)")
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                }.background(PersistenceExamples_FavoriteColorString2_getColor(name:resultColor))
                    .cornerRadius(8)
            }
            
            
        }
        .onAppear {
            resultColor = UserDefaults.standard.string(forKey: favoriteKey) ?? "No color saved"
        }
    }
}

struct FavoriteColorPersistenceViewStruct_FavoriteColorStruct: Codable {
    let favoriteColor: String
    let TimeStamp: Date
}


struct FavoriteColorPersistenceViewStruct: View {
    private let favoriteKey = "favoriteColor"
    
    @State private var favoriteColor: String = ""
    @State private var resultColor: String = "No color saved"
    @State private var resultColorStruct: FavoriteColorPersistenceViewStruct_FavoriteColorStruct
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter favorite color", text: $favoriteColor)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Save") {
                UserDefaults.standard.set(favoriteColor, forKey: favoriteKey)
                resultColor = favoriteColor // Update UI
            }
            .buttonStyle(.borderedProminent)
            
            Text("Favorite color: \(resultColor)")
                .bold()
                .foregroundColor(.white)
                .padding()
                .frame(width: 200, height: 50)
                .background(FavoriteColorPersistenceViewStruct_getColor(from: resultColor))
                .cornerRadius(8)
                .animation(.easeInOut, value: resultColor) // Smooth transition
        }
        .padding()
        .onAppear {
            resultColor = UserDefaults.standard.string(forKey: favoriteKey) ?? "No color saved"
        }
    }
    
    
    
    
    private func FavoriteColorPersistenceViewStruct_getColor(from name: String) -> Color {
        switch name.lowercased() {
            case "red": return .red
            case "blue": return .blue
            case "green": return .green
            case "yellow": return .yellow
            case "purple": return .purple
            case "orange": return .orange
            case "pink": return .pink
            case "black": return .black
            case "white": return .white
            default: return .gray
        }
    }
}

struct FavoriteColorPersistenceView_Previews: PreviewProvider {
    static var previews: some View {
        PersistenceExamples_FavoriteColorString3()
    }
}
