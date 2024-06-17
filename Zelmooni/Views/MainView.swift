//
//  MainView.swift
//  Zelmooni
//
//  Created by 문인범 on 6/17/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack {
                // TODO: 텍스트 수정 예정
                Text("😼")
                    .font(.system(size: 64))
                    .padding(.bottom, 20)
                
                VStack {
                    Text("재촉하지 마소")
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundStyle(.main)
                    Text("내일 잘 찾아가겠소")
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundStyle(.main)
                }
                .padding(.bottom, 100)

                Button {
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 2)
                            .foregroundStyle(.mainGray)
                            .frame(height: 80)
                        
                        HStack {
                            Text("📞")
                                .font(.system(size: 30))
                            Text("전화 테스트")
                                .font(.custom(FontName.neoSB, size: 20))
                                .padding(.horizontal, 34.5)
                        }
                    }
                }
                .padding(.horizontal, 48)
                .tint(.black)
                
                NavigationLink {
                    ModifyVoiceView()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 2)
                            .foregroundStyle(.mainGray)
                            .frame(height: 80)
                        
                        HStack {
                            Text("🔄")
                                .font(.system(size: 30))
                            Text("목소리 변경")
                                .font(.custom(FontName.neoSB, size: 20))
                                .padding(.horizontal, 34.5)
                        }
                    }
                }
                .padding(.horizontal, 48)
                .tint(.black)
                
            }
        }
        
    }
}

#Preview {
    MainView()
}
