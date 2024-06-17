//
//  MainView.swift
//  Zelmooni
//
//  Created by 문인범 on 6/17/24.
//

import SwiftUI



struct OnboardingView: View {
    @State private var selectedMode: Int?
    @State private var scrollOffset: CGFloat = 0
    
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    scrollObservableView
                    
                    OnboardingFirstView()
                        .frame(width: width)
                    
                    OnboardingSecondView()
                        .frame(width: width)

                    OnboardingThirdView(selectedMode: $selectedMode)
                        .frame(width: width)
                }
            }
            .scrollTargetBehavior(.paging)
            .scrollIndicators(.hidden)
            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { offset in
                self.scrollOffset = offset
                print(self.scrollOffset)
            }
            
//            Spacer()
            
            if selectedMode == nil {
                pageControl
                    .ignoresSafeArea(edges: .bottom)
                    .padding(.bottom, 78)
            } else {
                Button {
                    let ud = UserDefaults.standard
                    
                    // 처음 본 여부 저장
                    ud.setValue(true, forKey: UserDefaults.onboard)
                    
                    // 선택된 보이스 저장
                    guard let mode = self.selectedMode else {
                        print("목소리 선택이 되어있지 않습니다!")
                        return
                    }
                    ud.setValue(mode, forKey: UserDefaults.selectedVoice)
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.main)
                            .frame(height: 44)
                            .padding(.horizontal, 17)
                        
                        Text("등록")
                            .font(.custom(FontName.neoB, size: 20))
                            .tint(.white)
                    }
                }
                .padding(.bottom, 78)
            }
        }
        .animation(.easeInOut(duration: 0.3), value: selectedMode)
    }
    
    
    private var pageControl: some View {
        HStack {
            Circle()
                .frame(width: 10)
                .foregroundStyle( -self.scrollOffset < width ? .black : .caption )
            Circle()
                .frame(width: 10)
                .foregroundStyle( -self.scrollOffset < width * 2 && -self.scrollOffset >= width ? .black : .caption )
            Circle()
                .frame(width: 10)
                .foregroundStyle( -self.scrollOffset >= width * 2 ? .black : .caption )
        }
    }
    
    private var scrollObservableView: some View {
        GeometryReader { proxy in
            let offsetX = proxy.frame(in: .global).origin.x
            Color.clear
                .preference(key: ScrollOffsetPreferenceKey.self, value: offsetX)
                .onAppear {
                    scrollOffset = offsetX
                    print("screenWidth: \(width)")
                }
        }
        .frame(width: 0)
    }
}



#Preview {
    OnboardingView()
}
