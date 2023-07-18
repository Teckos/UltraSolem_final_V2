//
//  exemple.swift
//  exercice20
//
//  Created by Emma ORLANDINI on 25/10/2022.
//

import SwiftUI
import AVFoundation

var player : AVAudioPlayer!
struct PlaySound: View {

    var body: some View {
        ZStack{
            
            Button{
                playSound("reception")
            }label: {
                Text("Son")
            }
        }
        
    }
}
func playSound(_ song : String) {
    let url = Bundle.main.url(forResource: song, withExtension: "m4a")
    
    guard url != nil else{
        return
    }
    
    do{
        player = try AVAudioPlayer(contentsOf: url!)
        player?.play()
    }catch{
        print("\(error)")
    }
}
struct exemple_Previews: PreviewProvider {
    static var previews: some View {
        PlaySound()
    }
}

