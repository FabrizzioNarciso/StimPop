//
//  Database.swift
//  POP
//
//  Created by Fabrizio Narciso on 03/06/23.
//

import SwiftUI

class Index: ObservableObject {
    @AppStorage("index") var index: Int = 0
    @Published var current: Int = 0
}

struct ThemeData: Hashable {
    var id: String
    var balls: [String]
    var title: String
    var background: String
    var wall: String
    var board: String
    var fx: String
    var color: Color
    var preview: String
}

class Theme: ObservableObject {
    @Published var theme:[ThemeData] = [ThemeData(id: "Default", balls:
                                                    ["b1","b2","b3","b4","b5"], title: "titulo", background: "background",wall: "wall", board: "board", fx: "POP", color: Color.mint, preview: "preview"),
                                                  ThemeData(id: "Wood", balls: ["bw1","bw2","bw3","bw4","bw5"], title: "titlew", background: "backgroundw",wall: "wallw", board: "boardw", fx: "Chop", color: Color.red, preview: "previeww")
    ]
}
