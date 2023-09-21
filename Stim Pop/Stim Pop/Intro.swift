//
//  Intro.swift
//  POP
//
//  Created by Fabrizio Narciso on 13/04/23.
//

import SwiftUI

struct Intro: View {
    
    @StateObject var index = Index()
    @State var inicio: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                Image(Theme().theme[index.index].title)
                    .resizable()
                    .scaledToFit()
                    .padding(16)
                    .scaleEffect(inicio ? 1 : 1.025)
                    .animation(.easeInOut(duration: 1.5).repeatForever(), value: inicio)
                    .onAppear() {
                        inicio = true
                    }
                Spacer()
                
                NavigationLink {
                    Menu()
                } label: {
                    Label("Start", systemImage: "play.fill")
                        .font(.largeTitle)
                        .foregroundColor(.accentColor)
                        .padding(16)
                        .background(Color.black.opacity(0.8))
                        .background(Material.ultraThin)
                        .cornerRadius(10)
                }
                Spacer()
            }
            .background(
                ZStack {
                    Image(Theme().theme[index.index].background)
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                    Image(Theme().theme[index.index].wall)
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .scaleEffect(1.1)
                        .position(inicio ? CGPoint(x: geometry.size.width*0.5, y: geometry.size.height*0.5 + 250) : CGPoint(x: geometry.size.width*0.5, y: geometry.size.height*0.5-250))
                        .animation(.linear(duration: 20).repeatForever(), value: inicio)
                        .onAppear() {
                            inicio = true
                        }
                }
            )
        }
       
    }
}

struct Intro_Previews: PreviewProvider {
    static var previews: some View {
        Intro()
    }
}
