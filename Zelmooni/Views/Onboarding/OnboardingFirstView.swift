//
//  OnboardingFirstView.swift
//  Zelmooni
//
//  Created by 문인범 on 6/17/24.
//

import SwiftUI

struct OnboardingFirstView: View {
    var body: some View {
        VStack {
            Text("매일 6시 30분")
                .toTitle()
            Text("당신의 미라클 모닝을 위해")
                .toTitle()
            Text("전화를 해드릴게요.")
                .toTitle()
            
            Spacer()
            // TODO: 사진추가!
            EmptyView()
        }
        .padding(.top, 71)
    }
}
