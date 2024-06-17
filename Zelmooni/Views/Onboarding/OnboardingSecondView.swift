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
            .padding(.top, 71)
            
            Text("6시 이후에는 꺼져있도록 설정해주세요!")
                .font(.custom(FontName.neoB, size: 17))
                .foregroundStyle(.caption)
                .padding(.vertical, 46)
            
            Spacer()
            
            // TODO: 사진 추가!
            EmptyView()
        }
    }
}

#Preview {
    OnboardingSecondView()
}
