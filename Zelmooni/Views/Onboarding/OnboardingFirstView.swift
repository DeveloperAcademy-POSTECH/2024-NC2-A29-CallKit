//
//  OnboardingFirstView.swift
//  Zelmooni
//
//  Created by 문인범 on 6/17/24.
//

import SwiftUI

struct OnboardingFirstView: View {
    var body: some View {
        VStack {
            Text("매일 6시 30분")
                .toTitle()
            Text("당신의 미라클 모닝을 위해")
                .toTitle()
            Text("전화를 해드릴게요.")
                .toTitle()
            
            Spacer()
            
            VStack(spacing: 0) {
                Image(.mooni)
                    .resizable()
                    .frame(width: 163, height: 174)
                HStack {
                    Image(.ezel)
                        .resizable()
                        .frame(width: 114, height: 131)
                        .offset(y: -15)
                    Image(.gyuni)
                        .resizable()
                        .frame(width: 170, height: 190)
                }
                .padding(.leading, 40)
            }
            
            Spacer()
            
            NavigationLink {
                OnboardingSecondView()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.main)
                        .frame(height: 44)
                        .padding(.horizontal, 17)
                    
                    Text("다음")
                        .font(.custom(FontName.neoB, size: 20))
                        .tint(.white)
                }
            }
            .padding(.bottom, 83)
        }
        .padding(.top, 71)
    }
}


#Preview {
    OnboardingFirstView()
}
