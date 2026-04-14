//
//  SwiftUIView.swift
//  OnboardingKit
//
//  Created by naxxt on 14.04.2026.
//

import SwiftUI

public struct OnboardingView<Content: View>: View {
    @State var currentIndex = 0
    public var pages: [OnboardingPage<Content>]
    public var onFinish: () -> Void
    
    public init(pages: [OnboardingPage<Content>], onFinish: @escaping () -> Void) {
        self.pages = pages
        self.onFinish = onFinish
    }
    
   public var body: some View {
        VStack{
            OnboardingPageView(page: pages[currentIndex])
            Button {
                nextPage()
            } label: {
                Label("Next", systemImage: "heart")
            }


        }
    
    }
    func nextPage() {
        if currentIndex < pages.count - 1 {
            currentIndex += 1
        } else {
            onFinish()
        }
    }
}
 
