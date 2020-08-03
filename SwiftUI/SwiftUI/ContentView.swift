//
//  ContentView.swift
//  Test
//
//  Created by Medyannik Dmitri on 24.07.2020.
//  Copyright © 2020 Medyannik Dmitri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HStack {
            ForEach(0..<4) { index in
                CardView(isFaceUp: true)
            }
        }
        .foregroundColor(Color.orange)
        .padding(10.0)
        
    }
}

struct CardView: View {
    var isFaceUp: Bool
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10).stroke()
                Text("i")
            } else {
                RoundedRectangle(cornerRadius: 10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
