//
//  SmiteCompanionAppApp.swift
//  SmiteCompanionApp
//
//  Created by Michael DiGregorio on 1/12/22.
//

import SwiftUI

@main
struct SmiteCompanionAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
