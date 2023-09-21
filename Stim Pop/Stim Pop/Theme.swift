//
//  Theme.swift
//  Stim Pop
//
//  Created by Fabrizio Narciso on 04/06/23.
//

import SwiftUI

struct ThemeControl: View {
    
    @StateObject var index = Index()
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                
                Image(Theme().theme[index.index].background)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                
                VStack {
                    GeometryReader { geometry in
                        ScrollView(showsIndicators: false) {
                            LazyVGrid(columns: [GridItem()], spacing: 8) {
                                
                                Button {
                                    Index().index = 0
                                    
                                    
                                } label: {
                                    ZStack {
                                        Card(title: "Default",background: Theme().theme[0].title)
                                            .frame(height: geometry.size.height*0.4)
                                            .foregroundColor(Theme().theme[0].color)
                                        Image(Theme().theme[0].preview)
                                            .resizable()
                                            .frame(height: geometry.size.height*0.4)
                                            .cornerRadius(10)
                                            .opacity(0.8)
                                    }
                                }
                                
                                Button {
                                    Index().index = 1
                                    
                                } label: {
                                    ZStack {
                                        Card(title: "Wooden")
                                            .frame(height: geometry.size.height*0.4)
                                            .foregroundColor(Theme().theme[1].color)
                                        Image(Theme().theme[1].preview)
                                            .resizable()
                                            .frame(height: geometry.size.height*0.4)
                                            .cornerRadius(10)
                                            .opacity(0.8)
                                    }
                                }
                                
                            }
                        }
                    }
                }
                .padding()
            }
        }

    }
}

struct Theme_Previews: PreviewProvider {
    static var previews: some View {
        ThemeControl()
    }
}
