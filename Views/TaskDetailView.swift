import SwiftUI

struct TaskDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var dueDate: Date = Date()
    @State private var priority: TaskPriority = .medium

    var onSave: (StudyTask) -> Void

    var body: some View {
        Form {
            Section(header: Text("Task Details")) {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                Picker("Priority", selection: $priority) {
                    ForEach(TaskPriority.allCases, id: \.self) { priority in
                        Text(priority.rawValue).tag(priority)
                    }
                }
            }

            Button(action: {
                let newTask = StudyTask(
                    title: title,
                    description: description,
                    dueDate: dueDate,
                    priority: priority,
                    isCompleted: false
                )
                onSave(newTask)
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Save Task")
            }
        }
        .navigationTitle("Add/Edit Task")
    }
}
