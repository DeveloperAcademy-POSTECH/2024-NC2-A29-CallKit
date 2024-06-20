//
//  MainView.swift
//  Zelmooni
//
//  Created by 문인범 on 6/17/24.
//

import SwiftUI

struct MainView: View {
    @State private var viewModel = CallViewModel.shared
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(spacing: 5) {
                    VStack {
                        Text("재촉하지 마소")
                            .font(.custom(FontName.neoEB, size: 25))
                            .foregroundStyle(.main)
                        
                        Text("내일 잘 찾아가겠소")
                            .font(.custom(FontName.neoEB, size: 25))
                            .foregroundStyle(.main)
                    }
                    
                    HStack {
                        Image(.찡긋)
                            .resizable()
                            .frame(width: 162, height: 162)
                    }
                }

                Button {
//                    viewModel.isTest = true
                    viewModel.getTestCall()
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
                .padding(.top, 30)
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
            .fullScreenCover(isPresented: $viewModel.isCallComing) {
                CallMainView(isTest: viewModel.isTest)
            }
        }
    }
}

#Preview {
    MainView()
}
