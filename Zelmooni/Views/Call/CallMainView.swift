//
//  CallMainView.swift
//  Zelmooni
//
//  Created by 문인범 on 6/18/24.
//

import SwiftUI

struct CallMainView: View {
    var body: some View {
        VStack {
            Text("오늘의 명언을 작성해보세요.")
            
            // TODO: 리스트 중 랜덤으로 출력
            Text("편안한 영역에서 벗어날 때,\n진짜 삶이 시작된다")
        }
    }
}

#Preview {
    CallMainView()
}
