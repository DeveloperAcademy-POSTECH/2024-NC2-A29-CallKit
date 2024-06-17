//
//  ZelmooniApp.swift
//  Zelmooni
//
//  Created by 문인범 on 6/15/24.
//

import SwiftUI

@main
struct ZelmooniApp: App {
    let isReadOnboardingView: Bool = UserDefaults.standard.bool(forKey: UserDefaults.onboard)
    
    var body: some Scene {
        WindowGroup {
            if !isReadOnboardingView {
                OnboardingView()
            } else {
                
            }
        }
    }
}
