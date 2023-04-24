//
//  CoffeeHuntApp.swift
//  CoffeeHunt
//
//  Created by Александра Наврузова on 24/04/2023.
//

import SwiftUI

@main
struct CoffeeHuntApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
