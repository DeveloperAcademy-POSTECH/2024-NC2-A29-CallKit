//
//  ZelmooniApp.swift
//  Zelmooni
//
//  Created by 문인범 on 6/15/24.
//

import SwiftUI

@main
struct ZelmooniApp: App {
//    @State private var isReadOnboardingView: Bool = UserDefaults.standard.bool(forKey: UserDefaults.onboard)
    @State private var isReadOnboardingView: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if !isReadOnboardingView {
                OnboardingView()
            } else {
                MainView()
            }
        }
    }
}
