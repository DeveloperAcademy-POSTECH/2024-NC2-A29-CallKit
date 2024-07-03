//
//  OnboardingThirdView.swift
//  Zelmooni
//
//  Created by 문인범 on 6/17/24.
//

import SwiftUI

struct OnboardingThirdView: View {
    @State var selectedMode: Int?
    
    @Binding var isPresented: Bool
    
    let audioController = AudioController()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("목소리를 설정할 수 있어요!")
                .font(.custom(FontName.neoEB, size: 30))
                .foregroundStyle(.main)
                .padding(.top, 40)
                .padding(.bottom, 10)
            
            Text("선택한 목소리로 모닝콜을 해드립니다.\n나중에 바꿀 수 있어요!")
                .multilineTextAlignment(.leading)
                .font(.custom(FontName.neoB, size: 13))
                .foregroundStyle(.caption)
                .padding(.bottom, 58)
            
            VStack(spacing: 13) {
                ezelSelectView
                    .onTapGesture {
                        selectedMode = 0
                        audioController.startSampleAudio(0)
                        print("1")
                    }
                
                mooniSelectView
                    .onTapGesture {
                        selectedMode = 1
                        audioController.startSampleAudio(1)
                    }
                
                gyuniSelectView
                    .onTapGesture {
                        selectedMode = 2
                        audioController.startSampleAudio(2)
                    }
            }
            
            Spacer()
            
            NavigationLink {
                OnboardingFourthView(isPresented: $isPresented)
                    .navigationBarBackButtonHidden()
                    .onAppear {
                        audioController.startCompleteAudio(selectedMode!)
                        let ud = UserDefaults.standard
                        
                        // 처음 본 여부 저장
                        ud.setValue(true, forKey: UserDefaults.onboard)
                        
                        // 선택된 보이스 저장
                        guard let mode = self.selectedMode else {
                            print("목소리 선택이 되어있지 않습니다!")
                            return
                        }
                        ud.setValue(mode, forKey: UserDefaults.selectedVoice)
                    }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .tint(.main)
                        .frame(height: 44)
                    
                    Text("등록")
                        .font(.custom(FontName.neoB, size: 20))
                        .tint(.white)
                }
            }
            .disabled( self.selectedMode == nil )
            .padding(.bottom, 83)
        }
        .padding(.horizontal, 17)
    }
    
    
    var ezelSelectView: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 15)
                .stroke(lineWidth: 1.7)
                .foregroundStyle( self.selectedMode == 0 ? .select : .deselect)
                .frame(height: 104)
            
            RoundedRectangle(cornerRadius: 15)
                .frame(height: 104)
                .foregroundStyle(.white)
            
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
            
            RoundedRectangle(cornerRadius: 15)
                .frame(height: 104)
                .foregroundStyle(.white)
            
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
            
            RoundedRectangle(cornerRadius: 15)
                .frame(height: 104)
                .foregroundStyle(.white)
            
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

//#Preview {
//    OnboardingThirdView()
//}
