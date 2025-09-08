//
//  ContentView.swift
//  YouAreAwesome2
//
//  Created by Jazmine Singh on 8/31/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var sound = ""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    @State private var lastSoundNumber = -1
    let numberOfImages = 10
   
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
                    var soundNumber : Int
                    
                    repeat {
                        messageNumber = Int.random(in: 0...messages.count-1)
                        imageNumber = Int.random(in: 0...numberOfImages-1)
                        soundNumber = Int.random(in: 0...5)
                    } while messageNumber == lastMessageNumber || imageNumber == lastImageNumber || soundNumber == lastSoundNumber
                    
                    message = messages[messageNumber]
                    lastMessageNumber  = messageNumber
                    
                    imageName = "image\(imageNumber)"
                    lastImageNumber = imageNumber
                    
                     sound = "sound\(soundNumber)"
                    lastSoundNumber = soundNumber
                    
                   
                    guard let soundFile = NSDataAsset(name: sound) else {
                        print("😾 Cound not read file named \(sound)")
                        return
                        
                    }
                    do{
                        audioPlayer = try AVAudioPlayer(data: soundFile.data)
                        audioPlayer.play()
                    } catch {
                        print("😾 ERROR: \(error.localizedDescription) creating audioPlayer")
                        
                    }
                    
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
