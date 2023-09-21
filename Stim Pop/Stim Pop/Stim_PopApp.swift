//
//  Stim_PopApp.swift
//  Stim Pop
//
//  Created by Fabrizio Narciso on 03/06/23.
//

import SwiftUI


@main
struct Stim_PopApp: App {
    
    @StateObject var index = Index()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                Intro()
            }
            .preferredColorScheme(.dark)
            .tint(Theme().theme[index.index].color)
            
        }
    }
    
}
    
