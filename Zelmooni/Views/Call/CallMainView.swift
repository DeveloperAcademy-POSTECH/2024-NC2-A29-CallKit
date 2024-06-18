//
//  CallMainView.swift
//  Zelmooni
//
//  Created by 문인범 on 6/18/24.
//

import SwiftUI

struct CallMainView: View {
    @State private var viewModel = CallViewModel.shared
    @State private var inputText: String = ""
    @State private var isIncorrect: Bool = false
    @State private var animationOffset: CGFloat = 0
    @State private var isPresented: Bool = false
    
    @FocusState private var focused: Bool
    
    let isTest: Bool
    
    let randomPhrase: String = [
        "새로운 자기를 만들지 않은 날들은 모두 잃어버린 것으로 간주하라.",
        "오늘 아침 일어날 수 있으니 이 얼마나 행운인가",
        "어제의 꿈을 오늘의 행동으로 현실로 만드세요.",
        "내가 해내지 못할 일은 없다, 나의 능력은 무한대이다.",
        "특별한 삶은 매일 끊임없는 개선을 통해 만들어지는 것이다.",
        "편안한 영역에서 벗어날 때, 진짜 삶이 시작된다."
    ].randomElement()!
    
    var body: some View {
        VStack {
            if !isPresented {
                quizView
            } else {
                // TODO: - 뷰 연결
                Text("퀴즈 성공~")
            }
        }
    }
    
    var quizView: some View {
        VStack(alignment: .leading) {
            Text("오늘의 명언을 작성해보세요.")
                .font(.custom(FontName.neoB, size: 20))
                .foregroundStyle(.quizCaption)
            
            // TODO: 리스트 중 랜덤으로 출력
            Text(randomPhrase)
                .font(.custom(FontName.neoEB, size: 30))
                .foregroundStyle(.main)
            
            ZStack(alignment: .topLeading) {

                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(.textFieldInner)
                
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 1.3)
                    .foregroundStyle( isIncorrect ? .red : .textFieldBorder)
                
                TextEditor(text: $inputText)
                    .scrollContentBackground(.hidden)
                    .scrollDisabled(true)
                    .foregroundStyle( isIncorrect ? .red : .textFieldText)
                    .font(.custom(FontName.neoR, size: 17))
                    .padding(10)
                    .focused($focused)
                
                // Placeholder
                if inputText.isEmpty {
                    Text("여기에 입력해주세요!")
                        .font(.custom(FontName.neoR, size: 17))
                        .foregroundStyle(.textFieldPlaceholder)
                        .padding(15)
                }
            }
            .offset(x: self.animationOffset)
            .padding(.bottom, 50)
            
            HStack {
                Button {
                    if evaluateInputText() {
                        self.focused = false
                        viewModel.playNextVoice()
                        withAnimation(.spring) {
                            self.isPresented = true
                        }
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.main)
                        
                        Text("제출")
                            .font(.custom(FontName.neoB, size: 20))
                            .tint(.white)
                    }
                }
                .frame(height: 47)
                
                if viewModel.isTest {
                    Button {
                        viewModel.endTestCall()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundStyle(.red)
                            
                            Text("통화 종료")
                                .font(.custom(FontName.neoB, size: 20))
                                .tint(.white)
                        }
                    }
                    .frame(height: 47)
                }
            }
        }
        .padding(.horizontal, 16)
    }
    
    private func evaluateInputText() -> Bool {
        if inputText == randomPhrase {
            return true
        }
        
        self.isIncorrect = true
        UINotificationFeedbackGenerator().notificationOccurred(.error)
        withAnimation(.easeInOut(duration: 0.05).repeatCount(7, autoreverses: true), completionCriteria: .removed) {
            self.animationOffset = -5
        } completion: {
            self.animationOffset = 0
        }
        return false
    }
}

#Preview {
    CallMainView(isTest: true)
}
