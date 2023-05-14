//
//  MapScreen.swift
//  CoffeeHunt
//
//  Created by Sasha Navruzova on 25/04/2023.
//

import SwiftUI

struct MapScreen: View {
    var body: some View {
        MapView()
            .edgesIgnoringSafeArea(.top)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct MapScreen_Previews: PreviewProvider {
    static var previews: some View {
        MapScreen()
    }
}
