//
//  Card.swift
//  Stim Pop
//
//  Created by Fabrizio Narciso on 04/06/23.
//

import SwiftUI

struct Card: View {
    @State var title: String
    @State var description: String
    @State var icon: String
    @State var bottom: Bool = false
    
    var body: some View {
        VStack {
            VStack {
                HStack{
                    VStack{
                        HStack {
                            Image(systemName: icon).foregroundColor(.accentColor).font(.title)
                            Text(title).font(.title)
                            Spacer()
                        }
                        .padding(.bottom, 2)
                        HStack {
                            Text(description).font(.caption).foregroundColor(.secondary)
                            Spacer()
                        }
                    } .padding(.bottom,16)
                    Spacer()
                    Image(systemName: "chevron.right").foregroundColor(.secondary)
                        .padding(16)
                }
                if bottom == false {
                    Divider()
                }
            }
            .padding(.leading, 16)
            .padding(.top, 16)
            
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("Card"))
            )
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(title: "", description: "", icon: "")
    }
}
