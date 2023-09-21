//
//  Menu.swift
//  Stim Pop
//
//  Created by Fabrizio Narciso on 03/06/23.
//

import SwiftUI

struct Menu: View {
    @State var info: Bool =  true
    
    var body: some View {
        
        
        GeometryReader { geometry in
            VStack {
                Spacer()
                LazyVGrid(columns: [GridItem()], spacing: 8) {
                    
                    NavigationLink {
                        GameView(BallSize: 0.06, BallBounce: 0, BallFriction: 0, mode: true)
                    } label: {
                        if info == true {
                            Card(title: "Game Mode", description: "Match as many balls as possible to make points. Play against your highscore.",background: "gamecontroller")
                                .transition(.slide)
                                .frame(height: geometry.size.height*0.18)
                        } else {
                            Card(title: "Game Mode",background: "gamecontroller")
                                .frame(height: geometry.size.height*0.18)
                                .transition(.slide)
                        }
                        
                    }
                    
                    NavigationLink {
                        PopSetupView()
                    } label: {
                        if info == true {
                            Card(title: "Chill Mode", description: "No points. Ajust the settings to mix it up.",background: "party.popper")
                                .frame(height: geometry.size.height*0.18)
                                .transition(.slide)
                        } else {
                            Card(title: "Chill Mode",background: "party.popper")
                                .frame(height: geometry.size.height*0.18)
                                .transition(.slide)
                        }
                    }
                    
                    
                    NavigationLink {
                       Credits()
                    } label: {
                        if info == true {
                            Card(title: "About", description: "App Credits",background:"person.circle")
                                .frame(height: geometry.size.height*0.18)
                                .transition(.slide)
                        } else {
                            Card(title: "About",background:"person.circle")
                                .frame(height: geometry.size.height*0.18)
                                .transition(.slide)
                        }
                        
                    }
                }
                .padding(.horizontal,8)
                Spacer()
            }
            
        }
        .ignoresSafeArea()
            .background()
        
    }
    
}


struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
