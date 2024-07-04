//
//  ZelmooniApp.swift
//  Zelmooni
//
//  Created by 문인범 on 6/15/24.
//

import SwiftUI

@main
struct ZelmooniApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @State private var isReadOnboardingView: Bool = false
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .onAppear {
                    if !UserDefaults.standard.bool(forKey: UserDefaults.onboard) {
                        isReadOnboardingView = true
                    }
                }
                .fullScreenCover(isPresented: $isReadOnboardingView) {
                    OnboardingView(isPresented: $isReadOnboardingView)
                }
        }
    }
}
