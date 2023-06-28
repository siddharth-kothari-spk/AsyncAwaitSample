//
//  AsyncAwaitSampleApp.swift
//  AsyncAwaitSample
//
//  Created by Siddharth Kothari on 28/06/23.
//

import SwiftUI

@main
struct AsyncAwaitSampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
