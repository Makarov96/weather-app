//
//  weatherappApp.swift
//  Shared
//
//  Created by Guerin Steven Colocho Chacon on 29/05/22.
//

import SwiftUI

@main
struct weatherappApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
