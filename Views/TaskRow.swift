import SwiftUI

struct TaskRow: View {
    var task: StudyTask

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(task.title)
                .font(.headline)
                .foregroundColor(.primary)

            Text(task.description)
                .font(.subheadline)
                .foregroundColor(.secondary)

            HStack {
                Text("Due: \(task.dueDate, formatter: dateFormatter)")
                    .font(.caption)
                Spacer()
                Text(task.priority.rawValue)
                    .font(.caption)
                    .bold()
                    .foregroundColor(priorityTextColor(for: task.priority))
            }
        }
    }

    private func priorityTextColor(for priority: TaskPriority) -> Color {
        switch priority {
        case .high:
            return .red
        case .medium:
            return .orange
        case .low:
            return .green
        }
    }

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }
}
