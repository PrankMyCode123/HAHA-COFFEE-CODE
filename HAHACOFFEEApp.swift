//
//  HAHACOFFEEApp.swift
//  HAHACOFFEE
//
//  Created by Đinh Trung Quốc Anh on 20/9/24.
//

import SwiftUI

@main
struct HAHACOFFEEApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
