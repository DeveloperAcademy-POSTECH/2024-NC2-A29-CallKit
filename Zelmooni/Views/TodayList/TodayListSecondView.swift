//
//  TodayListSecondView.swift
//  Zelmooni
//
//  Created by 문인범 on 6/19/24.
//

import SwiftUI

struct TodayListSecondView: View {
    @State private var viewModel = CallViewModel.shared
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(.mainView)
                .resizable()
                .frame(width:150,height: 150)
            
            Text("오늘 하루도 활기차게\n시작할 수 있을 것 같아요!")
                .font(.custom(FontName.neoEB, size: 28))
                .foregroundStyle(.main)
                .multilineTextAlignment(.center)
            
            Text("힘내시길 바랍니다!")
                .font(.custom(FontName.neoB, size: 20))
                .foregroundStyle(.main)
                .padding(.top, 10)
            
            Spacer()
            
            Button {
                viewModel.endCall()
                viewModel.isCallComing = false
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.main)
                        .frame(height: 44)
                        .padding(.horizontal, 17)
                    
                    Text("메인 홈")
                        .font(.custom(FontName.neoB, size: 20))
                        .tint(.white)
                }
            }
            .padding(.bottom, 80)
            
        }
    }
}

#Preview {
    TodayListSecondView()
}
