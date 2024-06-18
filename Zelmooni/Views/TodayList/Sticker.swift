//
//  sticker.swift
//  Zelmooni
//
//  Created by Kim Minju on 6/18/24.
//

import SwiftUI

struct Sticker: View {
    @State var sticker: Bool = true
    
    let responses = [true, false, false, false, false]
    let texts = ["M", "T", "W", "T", "F"]
    
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
    }
    
    var body: some View {
        HStack(alignment: .center) {
            ForEach(0..<5) { index in
                VStack {
                    ZStack {
                        Circle()
                            .foregroundColor(.deselect)
                            .frame(width: 40, height: 40)
                            .padding(5)
                        
//                        if responses[index] {
//                            Image(.yescall)
//                                .resizable()
//                                .frame(width: 40, height: 40)
//                                .transition(.scale)
//                                .animation(.easeInOut(duration: 0.3), value: responses[index])
//                        } else {
//                            Image(.nocall)
//                                .resizable()
//                                .frame(width: 40, height: 40)
//                                .transition(.scale)
//                                .animation(.easeInOut(duration: 0.3), value: responses[index])
//                        }
                        
                        if savedList[index] {
                            Image(.yescall)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .transition(.scale)
                                .animation(.easeInOut(duration: 0.3), value: responses[index])
                            
                        } else if index <= today {
                            Image(.nocall)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .transition(.scale)
                                .animation(.easeInOut(duration: 0.3), value: responses[index])
                        }
                    }
                    
                    Text(texts[index])
                        .font(.custom(FontName.neoEB, size: 17))
                        .foregroundStyle(responses[index] ? .main : .mainGray)
                }
            }
        }
        .onAppear {
            
        }
    }
}

#Preview {
    Sticker()
}
