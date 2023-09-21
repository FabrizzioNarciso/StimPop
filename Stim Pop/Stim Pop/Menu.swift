//
//  Menu.swift
//  Stim Pop
//
//  Created by Fabrizio Narciso on 03/06/23.
//

import SwiftUI

struct Menu: View {
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                VStack{
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .padding(64)
                }
                VStack {
                    Card(title: "Score Mode", description: "Match to beat your high score.", icon: "trophy")
                        .padding(.bottom,-8)
                    Card(title: "Physics", description: "Play with the properties.", icon: "arrow.up.and.down.and.sparkles")
                        .padding(.bottom,-8)
                    Card(title: "Wall Mode", description: "Infinite bubbles.", icon: "infinity")
                        .padding(.bottom,-8)
                    Card(title: "About", description: "Game Credits.", icon: "info.circle",bottom: true)
                }
                .background(
                    RoundedRectangle(cornerRadius: 10.0)
                        .foregroundColor(Color("Card"))
                )
                .padding(16)
                Spacer()
            }
        }
        .background(Color("Background"))
        .ignoresSafeArea(.all)
        
    }
    
}



struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
