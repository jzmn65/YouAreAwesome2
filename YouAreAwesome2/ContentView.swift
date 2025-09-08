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
//    @State private var imageNumber = 0
//    @State private var messageNumber = 0
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    var body: some View {
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeInOut(duration: 0.15), value: message)
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30 ))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            Spacer()
            
            HStack {
                Button("Show Message"){
                    let messages = ["You are Awesome!",
                                    "When the Genius Bar Needs Help, They Call You!",
                                    "You Are Great!",
                                    "You Are Fantastic",
                                    "Fabulous? That's You!"]
                    
                    var messageNumber: Int
                    var imageNumber: Int
                    
                    repeat {
                        messageNumber = Int.random(in: 0...messages.count-1)
                        imageNumber = Int.random(in: 0...9)
                    } while messageNumber == lastMessageNumber || imageNumber == lastImageNumber
                    message = messages[messageNumber]
                    lastMessageNumber  = messageNumber
                    
                    imageName = "image\(imageNumber)"
                    lastImageNumber = imageNumber
                }
                
            }
        }
        .padding()
        .buttonStyle(.borderedProminent)
        .font(.title2)
    }
            
        }
    
    

#Preview {
    ContentView()
}
