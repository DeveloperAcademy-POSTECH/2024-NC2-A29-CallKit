//
//  sticker.swift
//  Zelmooni
//
//  Created by Kim minju  on 6/18/24.
//

import SwiftUI

struct Sticker: View {
    @State var sticker : Bool = true
    
    let responses = [true, false, false, false,false]
    let texts = ["M", "T", "W", "T", "F"]
    
    var body: some View {
        HStack (alignment: .center) {
            ForEach(0..<5) { index in
                VStack {
                    ZStack{
                        
                        Circle()
                            .foregroundColor(.deselect)
                            .frame(width: 40, height: 40)
                            .padding(5)
                        
                        if responses[index]{
                            Image(.yescall)
                                .resizable()
                                .frame(width: 40,height: 40)
                            
                        } else {
                            
                            Image(.nocall)
                                .resizable()
                                .frame(width: 40,height: 40)
                        }
                        
                    }
                    
                    Text(texts[index])
                        .font(.custom(FontName.neoEB, size: 17))
                        .foregroundStyle( responses[index] ? .main : .mainGray)
                }
            }
            
        }
    }
}


#Preview {
    Sticker()
}
