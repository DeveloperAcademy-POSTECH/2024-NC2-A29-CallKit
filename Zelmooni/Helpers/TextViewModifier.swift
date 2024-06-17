//
//  TextViewModifier.swift
//  Zelmooni
//
//  Created by 문인범 on 6/17/24.
//

import SwiftUI

struct TextViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom(FontName.neoEB, size: 28))
            .foregroundStyle(.main)
    }
}
