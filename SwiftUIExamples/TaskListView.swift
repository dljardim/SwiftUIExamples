//
//  TaskListVIew.swift
//  SwiftUIExamples
//
//  Created by Damian Jardim on 3/2/25.
//

import SwiftUI

struct TaskListView: View {
    @StateObject private var viewModel = TaskViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.tasks) {task in
                HStack{
                    Text(task.title)
                    Spacer()
                    Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(task.isCompleted ? .green : .gray)
                }
            }
            .navigationTitle("Tasks")
        }
    }
}
//
//#Preview {
//    TaskListView()
//}


struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
