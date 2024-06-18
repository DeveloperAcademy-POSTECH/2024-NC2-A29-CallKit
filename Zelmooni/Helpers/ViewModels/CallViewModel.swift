//
//  CallViewModel.swift
//  Zelmooni
//
//  Created by 문인범 on 6/18/24.
//

import SwiftUI
import CallKit
import PushKit


@Observable
class CallViewModel: NSObject {
    static let shared = CallViewModel()
    
    var isCallComing: Bool = false
    
    var audio: AudioController = .init()
    
    private override init() {
        super.init()
        
        let registry = PKPushRegistry(queue: nil)
        registry.delegate = self
        registry.desiredPushTypes = [.voIP]
    }
}


extension CallViewModel: PKPushRegistryDelegate, CXProviderDelegate {
    func providerDidReset(_ provider: CXProvider) {
        
    }
    
    func pushRegistry(_ registry: PKPushRegistry, didUpdate pushCredentials: PKPushCredentials, for type: PKPushType) {
        print(pushCredentials.token.map { String(format: "%02.2hhx", $0) }.joined())
    }
    
    func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
        action.fulfill()
        isCallComing = true
        self.audio.startAudio()
    }
    
    func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
        action.fulfill()
        isCallComing = false
        self.audio.stopAudio()
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
