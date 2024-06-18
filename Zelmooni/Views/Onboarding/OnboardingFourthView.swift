//
//  OnboardingFourthView.swift
//  Zelmooni
//
//  Created by 문인범 on 6/17/24.
//

import SwiftUI

struct OnboardingFourthView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Image(.check)
                .resizable()
                .frame(width: 105, height: 105)
            
            Text("등록완료")
                .font(.system(size: 30, weight: .bold))
                .foregroundStyle(.main)
            
            Text("내일부터 찾아뵐게요!")
                .font(.custom(FontName.neoB, size: 20))
                .foregroundStyle(.main)
            
            Spacer()
            
            NavigationLink {
                MainView()
                    .navigationBarBackButtonHidden()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .tint(.main)
                        .frame(height: 44)
                    
                    Text("메인 홈")
                        .font(.custom(FontName.neoB, size: 20))
                        .tint(.white)
                }
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 80)
            
        }
    }
}

#Preview {
    OnboardingFourthView()
}
