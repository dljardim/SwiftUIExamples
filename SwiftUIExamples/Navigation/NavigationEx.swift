import SwiftUI



struct NavigationEx_ContentView: View {
    
    struct City: Identifiable, Hashable {
        var id = UUID()
        var name:String
        var imageName:String
    }
    
    
    let cities:[City] = [
        City(name: "New York", imageName: "newyork"),
        City(name: "Paris", imageName: "paris"),
        City(name: "Tokyo", imageName: "tokyo")
        ]
    
    @State private var selectedCity: City? = nil
    
    var body: some View {
        NavigationSplitView {
            List(cities, selection: $selectedCity) { city in
                Text(city.name)
            }
        } detail: {
            if let city = selectedCity {
                Text("Welcome to \(city.name)!") // Updates dynamically
                    .font(.largeTitle)
                    .padding()
                
                Image(city.imageName)
                    .resizable()
                    .scaledToFit()
                
                Spacer()
                    
            } else {
                Text("Select a city to explore SwiftVille!")
                    .font(.title)
                    .padding()
            }
        }
    }
}




struct NavigationEx_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationEx_ContentView()

    }
}

