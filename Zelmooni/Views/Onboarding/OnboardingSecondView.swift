//
//  OnboardingSecondView.swift
//  Zelmooni
//
//  Created by 문인범 on 6/17/24.
//

import SwiftUI


struct OnboardingSecondView: View {
    var body: some View {
        VStack {
            VStack {
                Text("방해금지모드나 수면모드를")
                    .toTitle()
                Text("확인해주세요!")
                    .toTitle()
            }
            .padding(.top, 35)
            
            Text("6시 이후에는 꺼져있도록 설정해주세요!")
                .font(.custom(FontName.neoB, size: 17))
                .foregroundStyle(.caption)
                .padding(.top, 30)
            
            Image(.dnd)
                .resizable()
                .scaledToFit()
                .padding(.vertical, 34)

            Spacer()
            
            NavigationLink {
                OnboardingThirdView()
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
    }
}

#Preview {
    OnboardingSecondView()
}
