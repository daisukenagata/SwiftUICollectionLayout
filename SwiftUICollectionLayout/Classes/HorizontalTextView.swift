//
//  HorizontalTextView.swift
//  Pods
//
//  Created by 永田大祐 on 2020/02/23.
//

import SwiftUI

public struct HorizontalTextView: View {

    var evnents: HorizontalEvent
    var indexCount: [[Int]]
    let action: (_ index: Int) -> Void
    
    public init(event :HorizontalEvent, action: @escaping (Int) -> Void) {
        self.evnents = event
        self.indexCount = self.evnents.indexCount.chunked(into: self.evnents.horizontalCount)
        self.action = action
    }

    public var body: some View {
        ForEach(self.indexCount.indices, id: \.self) { idx in
            HStack {
                ForEach(self.indexCount[idx].indices, id: \.self) { index in
                    HStack {
                        Text("\(self.indexCount[idx][index])")
                            .font(.system(size: self.evnents.fontSize))
                            .frame(minWidth: 0, maxWidth: .infinity,  minHeight: 0, maxHeight: .infinity)
                    }.onTapGesture {
                        self.action(self.indexCount[idx][index])
                    }
                }
            }
            .background(self.evnents.textBtColor)
            .padding(.horizontal, self.evnents.horizontalValue)
        }
        .background(self.evnents.backColor)
        .padding(.vertical, self.evnents.verticalValue)
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
