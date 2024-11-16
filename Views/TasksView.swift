import SwiftUI

struct TasksView: View {
    @ObservedObject var dataManager: DataManager
    @State private var newTaskTitle = ""
    @State private var newTaskDescription = ""
    @State private var selectedPriority: TaskPriority = .low

    var body: some View {
        VStack {
            Text("Tasks")
                .font(.largeTitle)
                .bold()
                .padding()

            List {
                ForEach(dataManager.tasks) { task in
                    TaskRow(task: task)
                        .swipeActions {
                            Button(role: .destructive) {
                                deleteTask(task)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                }
            }

            VStack {
                TextField("Task Title", text: $newTaskTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Task Description", text: $newTaskDescription)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Picker("Priority", selection: $selectedPriority) {
                    ForEach(TaskPriority.allCases, id: \.self) { priority in
                        Text(priority.rawValue.capitalized)
                            .tag(priority)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())

                Button(action: addTask) {
                    Text("Add Task")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }

    private func addTask() {
        let newTask = StudyTask(title: newTaskTitle, description: newTaskDescription, dueDate: Date(), priority: selectedPriority)
        dataManager.tasks.append(newTask)
        newTaskTitle = ""
        newTaskDescription = ""
    }

    private func deleteTask(_ task: StudyTask) {
        if let index = dataManager.tasks.firstIndex(where: { $0.id == task.id }) {
            dataManager.tasks.remove(at: index)
        }
    }
}
