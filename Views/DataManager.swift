import Foundation
import SwiftUI

class DataManager: ObservableObject {
    @Published var tasks: [StudyTask] = [] // Stores all tasks
    @Published var reminders: [Reminder] = [] // Stores all reminders

    // MARK: - Task Management
    func addTask(_ task: StudyTask) {
        tasks.append(task)
        sortTasks()
    }

    func editTask(_ task: StudyTask, at index: Int) {
        if tasks.indices.contains(index) {
            tasks[index] = task
            sortTasks()
        }
    }

    func deleteTask(at index: Int) {
        if tasks.indices.contains(index) {
            tasks.remove(at: index)
        }
    }

    private func sortTasks() {
        tasks.sort { $0.dueDate < $1.dueDate }
    }

    // MARK: - Reminder Management
    func addReminder(_ reminder: Reminder) {
        reminders.append(reminder)
        sortReminders()
    }

    func editReminder(_ reminder: Reminder, at index: Int) {
        if reminders.indices.contains(index) {
            reminders[index] = reminder
            sortReminders()
        }
    }

    func deleteReminder(at index: Int) {
        if reminders.indices.contains(index) {
            reminders.remove(at: index)
        }
    }

    private func sortReminders() {
        reminders.sort { $0.date < $1.date }
    }
}
