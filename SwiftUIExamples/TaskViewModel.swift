import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    
    init() {
        loadTasks()
    }
    
    func loadTasks() {
        if let url = Bundle.main.url(forResource: "tasks", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let loadedTasks = try? decoder.decode([Task].self, from: data) {
                self.tasks = loadedTasks
            }
        }
    }
    
    
//
//    "id": 2,
//    "title": "Walk the dog",
//    "isCompleted": true
    
    func create(id:Int, title:String, isCompleted:Bool){
        // how do we handle ids in the app
        // ID()
    }
    
    func update(){
        
    }
    
    func delete(){
        
    }
}

/*
 
 @Published property will trigger updates in views that are observing it.
 In this case, any changes to tasks will trigger the update.
 
 */
