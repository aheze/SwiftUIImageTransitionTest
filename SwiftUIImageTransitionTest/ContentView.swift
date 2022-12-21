//
//  ContentView.swift
//  SwiftUIImageTransitionTest
//
//  Created by A. Zheng (github.com/aheze) on 12/21/22.
//  Copyright © 2022 A. Zheng. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var index: Int = 1
    @State private var forwards = false

    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
                .transition(
                    .asymmetric(
                        insertion: .move(edge: forwards ? .trailing : .leading),
                        removal: .move(edge: forwards ? .leading : .trailing)
                    )
                )
                .id(UUID())

            Button("Next") {
                index += 1
                forwards = true
                withAnimation {
                    loadImage()
                }
            }

            Button("Previous") {
                index -= 1
                forwards = false
                withAnimation {
                    loadImage()
                }
            }
        }
        .onAppear(perform: loadImage)
    }

    func loadImage() {
        let name = String(format: "image%02d", index)
        image = Image(name)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
