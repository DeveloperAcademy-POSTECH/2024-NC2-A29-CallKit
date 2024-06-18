//
//  final.swift
//  Zelmooni
//
//  Created by Kim minju  on 6/18/24.
//

import SwiftUI

struct FinalView: View {
    var body: some View {
        VStack {
            VStack{
                Text("☀️")
                    .font(.custom(FontName.neoEB, size: 50))
                    .foregroundStyle(.main)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                
                Text("오늘 하루도 활기차게\n시작할 수 있을 것 같아요!")
                    .font(.custom(FontName.neoEB, size: 28))
                    .foregroundStyle(.main)
                    .multilineTextAlignment(.center)
            }
            
            Text("힘내시길 바랍니다!")
                .font(.custom(FontName.neoB, size: 21))
                .foregroundStyle(.main)
                .multilineTextAlignment(.center)
                .padding()
        }
        .padding(.bottom)
    }
    
}

#Preview {
    FinalView()
}
