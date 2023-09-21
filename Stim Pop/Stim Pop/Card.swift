//
//  Card.swift
//  Stim Pop
//
//  Created by Fabrizio Narciso on 04/06/23.
//

import SwiftUI

struct Card: View {
    @State var title: String
    @State var description: String = ""
    @State var background: String = ""
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Material.ultraThick.opacity(0.3))
                .cornerRadius(10)
            Rectangle()
                .fill(Color.black.opacity(0.85))
                .cornerRadius(10)
            VStack {
                HStack {
                    Label(title, systemImage: background)
                        .padding(.leading,8)
                        .padding(.top,8)
                        //.foregroundColor(.white)
                        .font(.largeTitle)
                    Spacer()
                }
                
                HStack {
                    Text(description)
                        .padding(.leading,8)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.gray)
                    Spacer()
                }
                
                Spacer()
            }
            .padding(.horizontal, 8)
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(title: "", description: "")
    }
}
