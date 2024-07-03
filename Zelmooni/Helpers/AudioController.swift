//
//  AudioController.swift
//  Zelmooni
//
//  Created by 문인범 on 6/18/24.
//

import AVFoundation

class AudioController: NSObject {
    var audio: AVAudioPlayer?
    
    var status: AudioStatus?
    
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
            fileName = "이젤1"
        case 1:
            fileName = "무니1"
        default:
            fileName = "규니1"
        }
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "m4a") else {
            print("Invaild file path!")
            return
        }
        
        let session = AVAudioSession.sharedInstance()
        
        do {
            try session.setCategory(.playback, options: .mixWithOthers)
            try session.setActive(true)
            
//            try session.overrideOutputAudioPort(.speaker)
            
            self.audio = try AVAudioPlayer(contentsOf: url)
            audio?.delegate = self
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.audio?.play()
                print("started!")
                self.status = .first
            }
        } catch {
            print("startAudio func error, \(error.localizedDescription)")
        }
    }
    
    public func startSecondAudio() {
        self.audio?.stop()
        let fileName: String
        
        switch selectedVoice {
        case 0:
            fileName = "이젤2"
        case 1:
            fileName = "무니2"
        default:
            fileName = "규니2"
        }
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "m4a") else {
            print("Invaild file path two!")
            return
        }
        
        do {
            self.audio = try AVAudioPlayer(contentsOf: url)
            self.audio?.numberOfLoops = -1
            
            self.audio?.play()
            self.status = .second
            print("started!")
        } catch {
            print("startSecondAudio func error, \(error.localizedDescription)")
        }
    }
    
    public func startThirdAudio() {
        self.audio?.stop()
        
        let fileName: String
        
        switch selectedVoice {
        case 0:
            fileName = "이젤3"
        case 1:
            fileName = "무니3"
        default:
            fileName = "규니3"
        }
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "m4a") else {
            print("Invaild file path two!")
            return
        }
        
        do {
            self.audio = try AVAudioPlayer(contentsOf: url)
            self.audio?.play()
            
            self.status = nil
        } catch {
            print(error.localizedDescription)
        }
    }
    
    public func startSampleAudio(_ index: Int) {
        self.audio?.stop()
        
        let fileName: String
        
        switch index {
        case 0:
            fileName = "이젤선택"
        case 1:
            fileName = "무니선택"
        default:
            fileName = "규니선택"
        }
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "m4a") else {
            print("here")
            return
        }
        
        let session = AVAudioSession.sharedInstance()
        
        do {
            try session.setCategory(.playback)
            try session.setActive(true)
            
            self.audio = try AVAudioPlayer(contentsOf: url)
            self.audio?.play()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    public func startCompleteAudio(_ index: Int) {
        self.audio?.stop()
        
        let fileName: String
        
        switch index {
        case 0:
            fileName = "이젤선택완료"
        case 1:
            fileName = "무니선택완료"
        default:
            fileName = "규니선택완료"
        }
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "m4a") else {
            print("here")
            return
        }
        
        let session = AVAudioSession.sharedInstance()
        
        do {
            try session.setCategory(.playback)
            try session.setActive(true)
            
//            try session.overrideOutputAudioPort(.speaker)
            
            self.audio = try AVAudioPlayer(contentsOf: url)
            self.audio?.play()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    enum AudioStatus {
        case first
        case second
    }
    
}

// MARK: - Test 메소드
extension AudioController: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if self.status == .first, flag {
            startSecondAudio()
            self.status = .second
        }
    }
    
    public func startTestAudio() {
        do {
            let url = Bundle.main.url(forResource: "testmusic", withExtension: "m4a")

            // TODO: category 및 options 수정 필요
//            try AVAudioSession.sharedInstance().setCategory(.playAndRecord, options: .duckOthers)
//            try AVAudioSession.sharedInstance().setCategory(.playAndRecord, mode: .default)
//            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
//            try AVAudioSession.sharedInstance().setCategory(.playback, options: .mixWithOthers)
//            try AVAudioSession.sharedInstance().setCategory(.playAndRecord)
//            try AVAudioSession.sharedInstance().setActive(true)
            
//            try AVAudioSession.sharedInstance().overrideOutputAudioPort(.speaker)

            self.audio = try AVAudioPlayer(contentsOf: url!)
            audio?.numberOfLoops = -1
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.audio!.play()
                print("started!")
            }
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
