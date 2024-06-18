//
//  TestViewController.swift
//  Zelmooni
//
//  Created by 문인범 on 6/15/24.
//

import UIKit
import CallKit
import SwiftUI


class TestViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let provider = CXProvider(configuration: .init())
        provider.setDelegate(self, queue: nil)
        
        let update = CXCallUpdate()
        update.remoteHandle = CXHandle(type: .generic, value: "이젤")
        provider.reportNewIncomingCall(with: UUID(), update: update) { error in
            if let error = error {
                fatalError("error occured!, \(error.localizedDescription)")
            }
        }
        
        print("started!")
    }
}

extension TestViewController: CXProviderDelegate {
    func providerDidReset(_ provider: CXProvider) {
        
    }
    
    func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
        action.fulfill()
    }
    
    func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
        action.fulfill()
    }
    
}

struct TestView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> TestViewController {
        let vc = TestViewController()
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
