//
//  PushCallViewController.swift
//  Zelmooni
//
//  Created by 문인범 on 6/15/24.
//

import UIKit
import SwiftUI
import CallKit
import PushKit
import AVFoundation


class PushCallViewController: UIViewController {
    var audio: AudioController = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let registry = PKPushRegistry(queue: nil)
        registry.delegate = self
        registry.desiredPushTypes = [.voIP]
    }
}



extension PushCallViewController: CXProviderDelegate, PKPushRegistryDelegate {
    func providerDidReset(_ provider: CXProvider) {
        
    }
    
    func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
        action.fulfill()
        
        self.audio.startAudio()
    }
    
    func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
        action.fulfill()
        
        self.audio.stopAudio()
    }
    
    func pushRegistry(_ registry: PKPushRegistry, didUpdate pushCredentials: PKPushCredentials, for type: PKPushType) {
        print(pushCredentials.token.map { String(format: "%02.2hhx", $0) }.joined())
    }
    
    func pushRegistry(_ registry: PKPushRegistry, didReceiveIncomingPushWith payload: PKPushPayload, for type: PKPushType, completion: @escaping () -> Void) {
        let config = CXProviderConfiguration()
        config.includesCallsInRecents = true
        config.supportsVideo = false
        
        let provider = CXProvider(configuration: config)
        provider.setDelegate(self, queue: nil)
        
        let update = CXCallUpdate()
        update.remoteHandle = CXHandle(type: .generic, value: "규니")
        update.hasVideo = false
        
        provider.reportNewIncomingCall(with: UUID(), update: update) { error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        }
    }
    
}

struct PushCallView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> PushCallViewController {
        let vc = PushCallViewController()
        return vc
    }
    
    func updateUIViewController(_ uiViewController: PushCallViewController, context: Context) {
        
    }
}

class AudioController {
    var audio: AVAudioPlayer?
    
    func startAudio() {
        do {
            let url = Bundle.main.url(forResource: "pohang", withExtension: "m4a")

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
}
