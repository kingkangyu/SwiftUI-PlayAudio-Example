//
//  ContentView.swift
//  playaudio
//
//  Created by kangyu on 2020/7/7.
//  Copyright © 2020 kangyu. All rights reserved.
//

import SwiftUI
import AVFoundation
import Combine

struct ContentView: View {
    @State var player:AVAudioPlayer?
    
    var body: some View {
        VStack {
            Button(action: {
                //bundle文件
                let path = Bundle.main.path(forResource: "example.mp3", ofType:nil)!
                let filePath = URL(fileURLWithPath: path)
                print(path)
                print(filePath)
                
                do {
                    self.player = try AVAudioPlayer(contentsOf: filePath)
                    if (player == nil) {
                        print("player is nil")
                    }
                    self.player?.play()
            
                } catch let err {
                    print("Failed:\(err.localizedDescription)")
                }
            }) {
                Text("Play")
            }.padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            Button(action: {
                self.player?.stop()
            }) {
                Text("Stop")
            }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

