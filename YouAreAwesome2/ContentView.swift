//
//  ContentView.swift
//  YouAreAwesome2
//
//  Created by Jazmine Singh on 8/31/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    var body: some View {
        VStack {
            Spacer()
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30 ))
                .shadow(radius: 30)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            Spacer()
            HStack {
                Button("Press Me!"){
                    let message1 = "You are Awesome!"
                    let message2 = "You are Great!"
                    let imageString1 = "hand.thumbsup"
                    let imageString2 = "sun.max.fill"
                    
                    message = (message == message1 ? message2 : message1)
                    imageName = (imageName == "image0" ? "image2" : "image0")
                }
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)

            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
