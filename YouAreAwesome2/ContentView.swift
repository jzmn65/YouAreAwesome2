//
//  ContentView.swift
//  YouAreAwesome2
//
//  Created by Jazmine Singh on 8/31/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageString = ""
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: imageString)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
                .frame(width: 300, height: 300)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            Spacer()
            HStack {
                Button("Press Me!"){
                    let message1 = "You are Awesome!"
                    let message2 = "You are Great!"
                    let imageString1 = "hand.thumbsup"
                    let imageString2 = "sun.max.fill"
                    
                    if message == message1 {
                        message = message2
                        imageString = imageString2
                    } else {
                        message = message1
                        imageString = imageString1
                    }
                   
                    
                }
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
