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
                .padding(.top, 116)
                .padding(.bottom, 32)
            
            ZStack {
                Capsule()
                    .frame(height: 72.8)
                    .foregroundStyle(.onboardingTwo)
                    .overlay {
                        Text("방해금지 모드")
                            .font(.custom(FontName.neoM, size: 14.3))
                            .foregroundStyle(.white)
                    }
                
                HStack {
                    Image(systemName: "moon.fill")
                        .resizable()
                        .foregroundStyle(.white)
                        .frame(width: 19, height: 19)
                        .padding(.leading, 37.75)
                    
                    Spacer()
                }
            }
            .padding(.horizontal, 42)
                
            
            ZStack {
                Capsule()
                    .frame(height: 72.8)
                    .foregroundStyle(.onboardingTwo)
                    .overlay {
                        Text("수면")
                            .font(.custom(FontName.neoM, size: 14.3))
                            .foregroundStyle(.white)
                    }
                
                HStack {
                    Image(systemName: "bed.double.fill")
                        .resizable()
                        .foregroundStyle(.white)
                        .frame(width: 23.18, height: 15.72)
                        .padding(.leading, 37.75)
                    
                    Spacer()
                }
            }
            .padding(.horizontal, 42)

            
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
