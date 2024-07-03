//
//  TodayListMainView.swift
//  Zelmooni
//
//  Created by 문인범 on 6/18/24.
//

import SwiftUI

struct TodayListMainView: View {
    @State private var viewModel = CallViewModel.shared
    @State private var status: Status = .first
    @State private var isPresented: Bool = false
    
    init() {
        if today == 0 {
            UserDefaults.standard.setValue(false, forKey: "Mon")
            UserDefaults.standard.setValue(false, forKey: "Tue")
            UserDefaults.standard.setValue(false, forKey: "Wed")
            UserDefaults.standard.setValue(false, forKey: "Thu")
            UserDefaults.standard.setValue(false, forKey: "Fri")
        }
    }
    
    var body: some View {
        VStack {
            if !self.isPresented {
                Image(.todayDiary)
                    .resizable()
                    .frame(width: 150, height: 150)
                
                Text("오늘 기록 완료")
                    .font(.custom(FontName.neoEB, size: 30))
                    .foregroundStyle(.main)
                
                if self.status != .first {
                    sticker
                }
            } else {
                TodayListSecondView()
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 0.8).delay(1.5), completionCriteria: .logicallyComplete) {
                status = .second
            } completion: {
                withAnimation(.easeInOut(duration: 0.7).delay(0.7), completionCriteria: .logicallyComplete) {
                    status = .third
                } completion: {
                    withAnimation(.spring.delay(1.5)) {
                        isPresented = true
                    }
                }
            }
        }
    }
    
    
    var sticker: some View {
        HStack(spacing: 22) {
            ForEach(0..<5) { index in
                VStack {
                    ZStack {
                        Circle()
                            .foregroundStyle(.deselect)
                        
                        if index < today {
                            
                            if savedList[index] {
                                Image(.success)
                                    .resizable()
                                    .scaledToFit()
                            } else {
                                Image(.fail)
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                        
                        if status == .third, index == today {
                            Image(.success)
                                .resizable()
                                .scaledToFit()
                        }
                        
                    }
                    
                    Text(getWeekString(index))
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle( getWeekColor(index) )
                }
            }
        }
        .padding(.horizontal, 66)
    }
    
    enum Status {
        case first
        case second, third
    }
    
}


extension TodayListMainView {
    var savedList: [Bool] {
        var result: [Bool] = []
        result.append(UserDefaults.standard.bool(forKey: "Mon"))
        result.append(UserDefaults.standard.bool(forKey: "Tue"))
        result.append(UserDefaults.standard.bool(forKey: "Wed"))
        result.append(UserDefaults.standard.bool(forKey: "Thu"))
        result.append(UserDefaults.standard.bool(forKey: "Fri"))
        return result
    }
    
    var today: Int {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        let result = formatter.string(from: Date())
        
        switch result {
        case "Mon":
            return 0
        case "Tue":
            return 1
        case "Wed":
            return 2
        case "Thu":
            return 3
        default:
            return 4
        }
//        4
    }
    
    private func getWeekString(_ index: Int) -> String {
        switch index {
        case 0:
            return "M"
        case 1:
            return "T"
        case 2:
            return "W"
        case 3:
            return "T"
        default:
            return "F"
        }
    }
    
    private func getWeekColor(_ index: Int) -> Color {
        if savedList[index] {
            return .main
        } else {
            if today == index, status == .third {
                return .main
            }
        }
        return .todayListText
    }
}


#Preview {
    TodayListMainView()
}
