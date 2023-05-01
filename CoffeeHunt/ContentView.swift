//
//  ContentView.swift
//  CoffeeHunt
//
//  Created by Sasha Navruzova on 24/04/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var tabSelection: Int = 0
    
    var body: some View {
        
        TabView(selection: $tabSelection) {
            MapScreen()
                .tag(0)
                .tabItem {
                    Label("Map" , systemImage: "map")
                }
            ProfileScreen()
                .tag(1)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
