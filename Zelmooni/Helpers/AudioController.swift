//
//  AudioController.swift
//  Zelmooni
//
//  Created by 문인범 on 6/18/24.
//

import AVFoundation

class AudioController {
    var audio: AVAudioPlayer?
    
    func startAudio() {
        do {
            let url = Bundle.main.url(forResource: "testmusic", withExtension: "m4a")

            // TODO: category 및 options 수정 필요
//            try AVAudioSession.sharedInstance().setCategory(.playAndRecord, options: .duckOthers)
//            try AVAudioSession.sharedInstance().setCategory(.playAndRecord, mode: .default)
//            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setCategory(.playback, options: .mixWithOthers)
            try AVAudioSession.sharedInstance().setActive(true)
            
//            try AVAudioSession.sharedInstance().overrideOutputAudioPort(.speaker)

            self.audio = try AVAudioPlayer(contentsOf: url!)
            audio?.numberOfLoops = -1
            
//            self.audio!.prepareToPlay()
            
            self.audio!.play()
            print("started!")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func stopAudio() {
        self.audio?.stop()
    }
    
    func startSecondAudio() {
        stopAudio()
        
        do {
            let url = Bundle.main.url(forResource: "forest", withExtension: "mp3")
            
            try AVAudioSession.sharedInstance().setCategory(.playback, options: .mixWithOthers)
            try AVAudioSession.sharedInstance().setActive(true)
            
            self.audio = try AVAudioPlayer(contentsOf: url!)
            self.audio!.play()
            print("two started!")
        } catch {
            print(error.localizedDescription)
        }
    }
}

