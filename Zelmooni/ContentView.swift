//
//  ContentView.swift
//  Zelmooni
//
//  Created by 문인범 on 6/15/24.
//

import SwiftUI

struct ContentView: View {
    @State var audio: AudioController?
    
    var body: some View {
        PushCallView()
    }
}

#Preview {
    ContentView()
}
