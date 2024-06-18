//
//  Complete.swift
//  Zelmooni
//
//  Created by Kim minju  on 6/18/24.
//
//유저 디포트
import SwiftUI

struct Complete: View {
    var body: some View {
        VStack(alignment: .center) {
            Image("check")
                .resizable()
                .frame(width: 106, height: 106)
            
            Text("오늘 기록 완료")
                .font(.custom(FontName.neoEB, size: 30))
                .foregroundStyle(.main)
                .padding(.top)
                .padding(.bottom, 10)
             Spacer().frame(height:20)
                .padding(.bottom)
        }
        
            Sticker()
            .padding(.bottom)
            
        }
    }



#Preview {
    Complete()
}
