import SwiftUI

struct AddEditReminderView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var title: String = ""
    @State private var date: Date = Date()
    @State private var description: String = ""
    var onSave: (Reminder) -> Void

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Reminder Details")) {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                    DatePicker("Date", selection: $date)
                }
            }
            .navigationBarTitle("Add/Edit Reminder", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveReminder()
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }

    private func saveReminder() {
        let newReminder = Reminder(title: title, date: date, description: description)
        onSave(newReminder)
        presentationMode.wrappedValue.dismiss()
    }
}
