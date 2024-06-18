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
    
    public var isCallComing: Bool = false
    public var isTest: Bool = false
    
    private let callController = CXCallController()
    private var id: UUID?
    
    private var audio: AudioController = .init()
    
    var selectedVoice: String {
        switch UserDefaults.standard.integer(forKey: UserDefaults.selectedVoice) {
        case 0:
            return "이젤"
        case 1:
            return "무니"
        default:
            return "규니"
        }
    }
    
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
        isCallComing = true
        self.audio.startTestAudio()
        action.fulfill()
    }
    
    func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
        isCallComing = false
        self.isTest = false
        self.audio.stopAudio()
        action.fulfill()

    }
    
    func pushRegistry(_ registry: PKPushRegistry, didReceiveIncomingPushWith payload: PKPushPayload, for type: PKPushType, completion: @escaping () -> Void) {
        let config = CXProviderConfiguration()
        config.includesCallsInRecents = true
        config.supportsVideo = false
        
        let provider = CXProvider(configuration: config)
        provider.setDelegate(self, queue: nil)
        
        let update = CXCallUpdate()
        update.remoteHandle = CXHandle(type: .generic, value: selectedVoice)
        update.hasVideo = false
        
        self.id = UUID()
        
        provider.reportNewIncomingCall(with: self.id!, update: update) { error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        }
    }
}

// MARK: - 통화 테스트 버튼 메소드
extension CallViewModel {
    public func getTestCall() {
        let config = CXProviderConfiguration()
        config.includesCallsInRecents = true
        config.supportsVideo = false
        
        let provider = CXProvider(configuration: config)
        provider.setDelegate(self, queue: nil)
        
        let update = CXCallUpdate()
        update.remoteHandle = CXHandle(type: .generic, value: selectedVoice)
        update.hasVideo = false
        self.id = UUID()
                
        provider.reportNewIncomingCall(with: self.id!, update: update) { error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        }
    }
    
    public func endTestCall() {
        let endCallAction = CXEndCallAction(call: self.id!)
        let transaction = CXTransaction(action: endCallAction)
        
        callController.request(transaction) { error in
            if let error = error {
                print("cancel failed, \(error.localizedDescription)")
            }
        }
    }
}

// MARK: - 목소리 재생 메소드
extension CallViewModel {
    public func playNextVoice() {
        self.audio.startSecondAudio()
//        self.audio.startSecondTestAudio()
    }
}

extension CallViewModel {
    enum CallStatus {
        case acceptCall
        case complete
    }
}
