//
//  PopSetupView.swift
//  POP
//
//  Created by Fabrizio Narciso on 10/04/23.
//

import SwiftUI

struct PopSetupView: View {
    
    @State var BallSize: Double = 0.1
    @State var BallBounce: Double = 0
    @State var BallFriction: Double = 0
  
    
    
    func Check(Value:String) ->  Double {
        if let  Value = Double(Value ) {
            return Value
        } else {
            return -1
        }
    }
    
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                VStack{
                    HStack {
                        Text("Set all the paremeters")
                            .italic()
                            .font(.largeTitle)
                            .foregroundColor(.accentColor)
                            .padding(16)
                        Spacer()
                    }
                    Divider()
                        .background(Color.gray)
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                    
                    HStack {
                        Text("Size")
                            .font(.title)
                        Slider(value: $BallSize, in: 0.04...0.14, step: 0.02)
                    }
                    .foregroundColor(.gray)
                    .padding(16)
                    
                    Divider()
                        .background(Color.gray)
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                    
                    HStack {
                        Text("Elasticity")
                            .font(.title)
                        
                        Slider(value: $BallBounce, in: 0.2...0.8)
                    }
                    .foregroundColor(.gray)
                    .padding(16)
                    
                    Divider()
                        .background(Color.gray)
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                    
                    HStack {
                        Text("Friction")
                            .font(.title)
                        Slider(value: $BallFriction, in: 0.2...0.8)
                    }
                    .foregroundColor(.gray)
                    .padding(16)
                }
                .background(Color.black.opacity(0.7))
                .background(Material.ultraThin)
                .cornerRadius(30)
                .padding(16)
                
                Spacer()
                
                NavigationLink() {
                    GameView(BallSize: CGFloat(BallSize), BallBounce: CGFloat(BallBounce), BallFriction: CGFloat(BallFriction), mode:false )
                } label: {
                    Text("Play!")
                        .font(.largeTitle)
                        .foregroundColor(.accentColor)
                        .padding(32)
                        .background(Color.black.opacity(0.8))
                        .cornerRadius(10)
                    
                }
                Spacer()
            }
        }
        .background()
    }
}
