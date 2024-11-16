import SwiftUI

struct HomeView: View {
    @ObservedObject var dataManager: DataManager

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Upcoming Tasks")
                    .font(.title)
                    .bold()
                    .foregroundColor(.blue)

                if dataManager.tasks.isEmpty {
                    Text("No tasks available.")
                        .foregroundColor(.gray)
                } else {
                    ForEach(dataManager.tasks) { task in
                        TaskRow(task: task)
                            .padding()
                            .background(priorityColor(for: task.priority))
                            .cornerRadius(10)
                    }
                }

                Text("Reminders")
                    .font(.title)
                    .bold()
                    .foregroundColor(.green)

                if dataManager.reminders.isEmpty {
                    Text("No reminders available.")
                        .foregroundColor(.gray)
                } else {
                    ForEach(dataManager.reminders) { reminder in
                        ReminderRow(reminder: reminder)
                            .padding()
                            .background(Color.yellow.opacity(0.3))
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
        .background(Color.gray.opacity(0.1))
        .navigationBarTitle("Home", displayMode: .inline)
    }

    private func priorityColor(for priority: TaskPriority) -> Color {
        switch priority {
        case .high:
            return Color.red.opacity(0.3)
        case .medium:
            return Color.orange.opacity(0.3)
        case .low:
            return Color.green.opacity(0.3)
        }
    }
}
