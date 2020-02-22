//
//  HorizontalScrollView.swift
//  Pods
//
//  Created by 永田大祐 on 2020/02/23.
//

import  SwiftUI

public struct HorizontalScrollView: View {

    var rect = CGRect()
    var evnents: HorizontalEvent
    let action: (_ index: Int) -> Void

    @State private var index: Int = 0
    @State private var offset: CGFloat = 0

    public init(event :HorizontalEvent, action: @escaping (Int) -> Void) {
        rect = UIScreen.main.bounds
        self.evnents = event
        self.action = action
    }

    public var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack {
                ForEach(1..<self.evnents.forEachCount) { _ in
                    VStack {
                        HorizontalTextView(event: self.evnents, action: self.action)
                    }
                }
                .frame(width: self.rect.width, height: self.rect.height/self.evnents.textHeightValue)
            }
        }
        .content.offset(x: self.offset)
        .frame(width: rect.width * CGFloat(self.evnents.forEachCount), alignment: .center)
        .gesture(DragGesture()
        .onChanged({ value in
            self.offset = value.translation.width - self.rect.width * CGFloat(self.index)
        })
            .onEnded({ value in
                let scrollThreshold = self.rect.width / 2
                if value.predictedEndTranslation.width < -scrollThreshold {
                    self.index = min(self.index+1, self.evnents.forEachCount)
                } else if value.predictedEndTranslation.width > scrollThreshold {
                    self.index = max(self.index-1, -self.evnents.forEachCount)
                }

                withAnimation {
                    self.offset = -self.rect.width * CGFloat(self.index)
                    self.offset = self.index == 0 ? self.offset : (self.offset - CGFloat(self.index * 8))
                }
            })
        )
    }
}
