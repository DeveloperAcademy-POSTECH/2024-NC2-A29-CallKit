//
//  OnboardingThirdView.swift
//  Zelmooni
//
//  Created by 문인범 on 6/17/24.
//

import SwiftUI

struct OnboardingThirdView: View {
    @Binding var selectedMode: Int?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("목소리를 설정할 수 있어요!")
                .font(.custom(FontName.neoEB, size: 30))
                .foregroundStyle(.main)
                .padding(.top, 88)
                .padding(.bottom, 20)
            
            Text("선택한 목소리로 모닝콜을 해드립니다.\n나중에 바꿀 수 있어요!")
                .multilineTextAlignment(.leading)
                .font(.custom(FontName.neoB, size: 13))
                .foregroundStyle(.caption)
                .padding(.bottom, 58)
            
            VStack(spacing: 13) {
                ezelSelectView
                    .onTapGesture {
                        selectedMode = 0
                    }
                
                mooniSelectView
                    .onTapGesture {
                        selectedMode = 1
                    }
                
                gyuniSelectView
                    .onTapGesture {
                        selectedMode = 2
                    }
            }
            
            Spacer()
        }
        .animation(.easeInOut(duration: 0.3), value: selectedMode)
        .padding(.horizontal, 17)
    }
    
    
    var ezelSelectView: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 15)
                .stroke(lineWidth: 1.7)
                .foregroundStyle( self.selectedMode == 0 ? .select : .deselect)
                .frame(height: 104)
            
            VStack(alignment: .leading) {
                Text("이젤 모드")
                    .font(.custom(FontName.neoB, size: 18))
                    .padding(.bottom, 1)
                Text("아침에 친근함을 원한다면?")
                    .font(.custom(FontName.neoB, size: 12))
                    .foregroundStyle(.caption)
                Text("가장 친한 친구가 해주는 모닝콜! 재미있게 하루를 시작해보세요!")
                    .font(.custom(FontName.neoB, size: 12))
                    .foregroundStyle(.caption)
            }
            .padding(.horizontal, 25)
        }
    }
    
    var mooniSelectView: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 15)
                .stroke(lineWidth: 1.7)
                .foregroundStyle( self.selectedMode == 1 ? .select : .deselect)
                .frame(height: 104)
            
            VStack(alignment: .leading) {
                Text("무니 모드")
                    .font(.custom(FontName.neoB, size: 18))
                    .padding(.bottom, 1)
                Text("부드러운 목소리로 깨워주는 스윗보이~")
                    .font(.custom(FontName.neoB, size: 12))
                    .foregroundStyle(.caption)
                Text("다정한 목소리로 두근두근 설레는 하루 시작해보세요!")
                    .font(.custom(FontName.neoB, size: 12))
                    .foregroundStyle(.caption)
            }
            .padding(.horizontal, 25)
        }
    }
    
    var gyuniSelectView: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 15)
                .stroke(lineWidth: 1.7)
                .foregroundStyle( self.selectedMode == 2 ? .select : .deselect)
                .frame(height: 104)
            
            VStack(alignment: .leading) {
                Text("규니 모드")
                    .font(.custom(FontName.neoB, size: 18))
                    .padding(.bottom, 1)
                Text("규니 하고싶은거 다해...")
                    .font(.custom(FontName.neoB, size: 12))
                    .foregroundStyle(.caption)
                Text("아찔하게 시작하고 싶다면 규니로 상쾌한 아침을 맞이해보세요!")
                    .font(.custom(FontName.neoB, size: 12))
                    .foregroundStyle(.caption)
            }
            .padding(.horizontal, 25)
        }
    }
    
}

#Preview {
    OnboardingThirdView(selectedMode: .constant(0))
}
