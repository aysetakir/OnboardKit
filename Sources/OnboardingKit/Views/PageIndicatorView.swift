//
//  SwiftUIView.swift
//  OnboardingKit
//
//  Created by naxxt on 15.04.2026.
//

import SwiftUI

public struct PageIndicatorView: View {
    
    public var pageCount: Int
    public var currentIndex: Int
    public var indicatorColor: Color = .accentColor
    
    public init(pageCount: Int, currentIndex: Int) {
        self.pageCount = pageCount
        self.currentIndex = currentIndex
    }
    
    public var body: some View {
        HStack{
            ForEach(0..<pageCount, id: \.self) { index in
                Circle()
                    .foregroundStyle(index == currentIndex ? indicatorColor : .gray.opacity(0.3) )
                    .frame(width: index == currentIndex ? 11 : 8)
            }
        }
    }
    
    func indicatorColor(_ color: Color) -> PageIndicatorView {
        var view = self
        view.indicatorColor = color
        return view
    }
}
