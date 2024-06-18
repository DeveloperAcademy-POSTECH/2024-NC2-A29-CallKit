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
        
        self.audio.startTestAudio()
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

