//
//  LaunchScreen.swift
//  CoffeeHunt
//
//  Created by Sasha Navruzova on 23/04/2023.
//

import SwiftUI

struct LaunchScreen: View {
    
    var launchIcon: some View {
        Image("launchScreenIcon")
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 300)
    }
    
    var linearGradient: some View {
        LinearGradient(gradient:
                        Gradient(stops: [
                            .init(color: Color(red: 255/255, green: 248/255, blue: 82/255), location: 0),
                            .init(color: Color(red: 255/255, green: 248/255, blue: 82/255), location: 0.62),
                            .init(color: .white, location: 1)
                        ]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
    }
    
    var body: some View {
        ZStack {
            linearGradient
            launchIcon
        }
        .ignoresSafeArea()
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
