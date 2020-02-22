//
//  ContentView.swift
//  SwiftUICollectionLayout_Example
//
//  Created by 永田大祐 on 2020/02/23.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import SwiftUI
import SwiftUICollectionLayout
struct ContentView: View {
    @State private var text = ""
    private let evnent = HorizontalEvent(id: 1,
                                         indexCount:  [01,02,03,04,05,06,07,08,09,
                                                       02,04,06,08,10,12,14,16,18,
                                                       03,06,09,12,15,18,21,24,27,
                                                       04,08,12,16,20,24,28,32,36,
                                                       05,10,15,20,25,30,35,40,45,
                                                       06,12,18,24,30,36,42,48,54,
                                                       07,14,21,28,35,42,49,56,63,
                                                       08,12,18,24,40,48,56,64,72,
                                                       09,18,27,36,45,54,63,72,81],
                                         horizontalCount: 9,
                                         forEachCount: 12,
                                         horizontalValue: 0,
                                         verticalValue: 0,
                                         textHeightValue: 1,
                                         fontSize: 12,
                                         textBtColor: Color.red,
                                         backColor: Color.white)
    var body: some View {
        ZStack {
            HorizontalScrollView(event: self.evnent, action: { tex in
                self.text = tex
            })
            Text(self.text)
                .background(Color.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
