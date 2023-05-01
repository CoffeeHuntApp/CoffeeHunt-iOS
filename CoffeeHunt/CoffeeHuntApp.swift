//
//  CoffeeHuntApp.swift
//  CoffeeHunt
//
//  Created by Sasha Navruzova on 22/04/2023.
//

import SwiftUI

@main
struct CoffeeHuntApp: App {
    let persistenceController = PersistenceController.shared
    
    @State private var showLaunchScreen = true
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                LaunchScreen()
                    .opacity(showLaunchScreen ? 1.0 : 0.0)
                    .animation(.easeOut(duration: 0.5), value: showLaunchScreen)
                ContentView()
                    .opacity(showLaunchScreen ? 0.0 : 1.0)
                    .animation(.easeOut(duration: 0.5), value: showLaunchScreen)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    showLaunchScreen = false
                }
            }
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
