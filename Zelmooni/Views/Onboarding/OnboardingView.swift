//
//  MainView.swift
//  Zelmooni
//
//  Created by 문인범 on 6/17/24.
//

import SwiftUI



struct OnboardingView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            NavigationStack {
                OnboardingFirstView(isPresented: $isPresented)
            }
            .tint(.main)
        }
    }
}
