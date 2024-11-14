//
//  Smart_StudyApp.swift
//  Smart Study
//
//  Created by Sandeep Ranjan on 14/11/24.
//

import SwiftUI

@main
struct Smart_StudyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
