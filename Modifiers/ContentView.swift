//
//  ContentView.swift
//  Modifiers
//
//  Created by Ozan Çiçek on 23.07.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            
            Spacer()
            VStack {
                Text("Hello, world!")
                    .textFontStyle(.H1Bold)
                    .frame(width: UIScreen.main.bounds.width * 0.8, alignment: .center)

                Button(action: {
                }, label: {
                    Text("Lütfen Onaylayın")
                })
                .customButtonStyle(.elipsis)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
