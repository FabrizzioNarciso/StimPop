//
//  Credits.swift
//  Stim Pop
//
//  Created by Fabrizio Narciso on 06/06/23.
//

import SwiftUI

struct Credits: View {
    @State var inicio: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text ("Stim Pop")
                    //.foregroundColor(Theme().theme[index.index].color)
                    .font(.largeTitle)
                    .padding()
                Text("Stim Pop was created as part of the 2023 Swift Student Challenge.")
                Text("The current version of the app is very different from the one send to the Challenge.")
                    .padding()
                Spacer()
                Text("Thanks to all my colleagues and mentors in Eldorado Apple Academy, whose help made this project possible.")
                HStack {
                    Text("Dev & Design")
                        .foregroundColor(Color.gray)
                        .padding()
                    Text("Fabrizio Narciso")
                        .padding()
                }
                .padding()
                HStack {
                    VStack {
                        Spacer()
                        Text("Support Team")
                            .foregroundColor(Color.gray)
                        Spacer()
                    }
                    VStack {
                        Text("Ana Laura Alvez")
                        Text("Anna Carolina Rodrigues")
                        Text("Felipe Luna")
                        Text("Geovana Contine")
                        Text("Samuel Fonseca")
                        Text("Sergio Ordine")
                        Text("Rafael Seixas")
                    }
                }
                Text("Special thanks to Paul Hudson for his Swift tutorials.")
                    .padding()
            }
            .ignoresSafeArea()
            .multilineTextAlignment(.center)
            .padding()
            .background(
               
            )
            .onAppear() {
                inicio = true
            }
        }
    }
}

struct Credits_Previews: PreviewProvider {
    static var previews: some View {
        Credits()
    }
}
