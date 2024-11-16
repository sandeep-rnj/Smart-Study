import SwiftUI

struct ReminderRow: View {
    var reminder: Reminder

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(reminder.title)
                .font(.headline)
                .foregroundColor(.purple)

            Text(reminder.description)
                .font(.subheadline)
                .foregroundColor(.secondary)

            Text("Date: \(reminder.date, formatter: dateFormatter)")
                .font(.caption)
        }
    }

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }
}
