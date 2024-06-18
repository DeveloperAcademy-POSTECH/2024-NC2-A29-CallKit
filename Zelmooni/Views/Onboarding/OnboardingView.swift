//
//  MainView.swift
//  Zelmooni
//
//  Created by 문인범 on 6/17/24.
//

import SwiftUI



struct OnboardingView: View {
    var body: some View {
        VStack {
            NavigationStack {
                OnboardingFirstView()
            }
            .tint(.main)
        }
    }
}



#Preview {
    OnboardingView()
}
