import SwiftUI

struct ContentView: View {
    @StateObject private var dataManager = DataManager()

    var body: some View {
        TabView {
            HomeView(dataManager: dataManager)
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            TasksView(dataManager: dataManager)
                .tabItem {
                    Label("Tasks", systemImage: "checklist")
                }

            RemindersView(dataManager: dataManager)
                .tabItem {
                    Label("Reminders", systemImage: "bell")
                }
        }
        .accentColor(.blue)
    }
}
