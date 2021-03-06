//
//  HorizontalEvent.swift
//  Pods
//
//  Created by 永田大祐 on 2020/02/23.
//

import SwiftUI

public class HorizontalEvent: ObservableObject {
    public var id: Int
    public var indexCount: [Int]
    public var horizontalCount: Int
    public var forEachCount: Int
    public var plusCount: Int
    public var horizontalValue: CGFloat
    public var verticalValue: CGFloat
    public var textHeightValue: CGFloat
    public var fontSize: CGFloat
    public var textBtColor: Color
    public var backColor: Color
    public init(id: Int,
                indexCount: [Int],
                horizontalCount: Int,
                forEachCount: Int,
                plusCount: Int,
                horizontalValue: CGFloat,
                verticalValue: CGFloat,
                textHeightValue: CGFloat,
                fontSize: CGFloat,
                textBtColor: Color,
                backColor: Color) {
        self.id = id
        self.indexCount = indexCount
        self.horizontalCount = horizontalCount
        self.forEachCount = forEachCount
        self.plusCount = plusCount
        self.horizontalValue = horizontalValue
        self.verticalValue = verticalValue
        self.textHeightValue = textHeightValue
        self.fontSize = fontSize
        self.textBtColor = textBtColor
        self.backColor = backColor
    }
}
