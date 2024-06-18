//
//  AudioController.swift
//  Zelmooni
//
//  Created by 문인범 on 6/18/24.
//

import AVFoundation

class AudioController {
    var audio: AVAudioPlayer?
    
    var selectedVoice: Int {
        UserDefaults.standard.integer(forKey: UserDefaults.selectedVoice)
    }
    
    public func stopAudio() {
        self.audio?.stop()
    }
    
    public func startAudio() {
        let fileName: String
        
        switch selectedVoice {
        case 0:
            fileName = "ezel_first"
        case 1:
            fileName = "mooni_first"
        default:
            fileName = "gyuni_first"
        }
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "m4a") else {
            print("Invaild file path!")
            return
        }
        let session = AVAudioSession.sharedInstance()
        
        do {
            try session.setCategory(.playback, options: .mixWithOthers)
            try session.setActive(true)
            
            self.audio = try AVAudioPlayer(contentsOf: url)
            self.audio?.play()
            print("started!")
        } catch {
            print("startAudio func error, \(error.localizedDescription)")
        }
    }
    
    public func startSecondAudio() {
        self.audio?.stop()
        
        let fileName: String
        
        switch selectedVoice {
        case 0:
            fileName = "ezel_second"
        case 1:
            fileName = "mooni_second"
        default:
            fileName = "gyuni_second"
        }
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "m4a") else {
            print("Invaild file path two!")
            return
        }
        
        let session = AVAudioSession.sharedInstance()
        
        do {
            try session.setCategory(.playback, options: .mixWithOthers)
            try session.setActive(true)
            
            self.audio = try AVAudioPlayer(contentsOf: url)
            self.audio?.play()
            
            print("started!")
        } catch {
            print("startSecondAudio func error, \(error.localizedDescription)")
        }
    }
    
}

// MARK: - Test 메소드
extension AudioController {
    public func startTestAudio() {
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
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.audio!.play()
                print("started!")
            }
//            self.audio!.play()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    public func startSecondTestAudio() {
        stopAudio()
        
        do {
            let url = Bundle.main.url(forResource: "forest", withExtension: "mp3")
            
            try AVAudioSession.sharedInstance().setCategory(.playAndRecord, options: .mixWithOthers)
            try AVAudioSession.sharedInstance().setActive(true)
            
            self.audio = try AVAudioPlayer(contentsOf: url!)
            self.audio!.play()
            if self.audio!.isPlaying {
                print("started!")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
