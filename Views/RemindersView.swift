import SwiftUI

struct RemindersView: View {
    @ObservedObject var dataManager: DataManager
    @State private var newReminderTitle = ""
    @State private var newReminderDescription = ""
    @State private var reminderDate = Date()

    var body: some View {
        VStack {
            Text("Reminders")
                .font(.largeTitle)
                .bold()
                .padding()

            List {
                ForEach(dataManager.reminders) { reminder in
                    ReminderRow(reminder: reminder)
                        .swipeActions {
                            Button(role: .destructive) {
                                deleteReminder(reminder)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                }
            }

            VStack {
                TextField("Reminder Title", text: $newReminderTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Reminder Description", text: $newReminderDescription)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                DatePicker("Date", selection: $reminderDate, displayedComponents: [.date, .hourAndMinute])

                Button(action: addReminder) {
                    Text("Add Reminder")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }

    private func addReminder() {
        let newReminder = Reminder(title: newReminderTitle, date: reminderDate, description: newReminderDescription)
        dataManager.reminders.append(newReminder)
        newReminderTitle = ""
        newReminderDescription = ""
    }

    private func deleteReminder(_ reminder: Reminder) {
        if let index = dataManager.reminders.firstIndex(where: { $0.id == reminder.id }) {
            dataManager.reminders.remove(at: index)
        }
    }
}
