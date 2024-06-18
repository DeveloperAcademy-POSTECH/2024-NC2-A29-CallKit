//
//  final.swift
//  Zelmooni
//
//  Created by Kim Minju on 6/18/24.
//

import SwiftUI



struct FinalView: View {
    var body: some View {
   
            ZStack {
                VStack {
                    Spacer()
                    VStack {
                        
                        Text("☀️")
                            .font(.custom(FontName.neoEB, size: 50))
                            .foregroundStyle(.main)
                            .multilineTextAlignment(.center)
                            .padding(.bottom)
                        
                        Text("오늘 하루도 활기차게\n시작할 수 있을 것 같아요!")
                            .font(.custom(FontName.neoEB, size: 28))
                            .foregroundStyle(.main)
                            .multilineTextAlignment(.center)
                        
                        Text("힘내시길 바랍니다")
                            .font(.custom(FontName.neoB, size: 21))
                            .foregroundStyle(.main)
                            .multilineTextAlignment(.center)
                            .padding(.top)
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(height: 47)
                            .foregroundStyle(.main)
                            .overlay {
                                Text("메인홈")
                                    .font(.custom(FontName.neoB, size: 20))
                                    .foregroundColor(.white)
                            }
                    }
                    .padding(.bottom, 58)
                    
//                    NavigationLink(destination: MainView()) {
//                        RoundedRectangle(cornerRadius: 15)
//                            .frame(height: 47)
//                            .foregroundStyle(.main)
//                            .overlay {
//                                Text("메인홈")
//                                    .font(.custom(FontName.neoB, size: 20))
//                                    .foregroundColor(.white)
//                            }
//                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }


#Preview {
    FinalView()
}
