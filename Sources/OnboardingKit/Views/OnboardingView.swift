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
    
    private var isLastPage: Bool {
        currentIndex == pages.count - 1
    }
    private var isFirstPage: Bool {
        currentIndex == 0
    }
    
   public var body: some View {
      
        VStack{
            OnboardingPageView(page: pages[currentIndex])
            Spacer()
            HStack {
                Button {
                    previousPage()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                }
                .opacity(isFirstPage ? 0 : 1)
                .disabled(isFirstPage)

                Spacer()

                Button {
                    nextPage()
                } label: {
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.black)
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 20)
        }
        .overlay(alignment: .topTrailing) {
            if !isLastPage {
                Button("Skip"){
                    onFinish()
                }
                .font(.subheadline)
                .foregroundStyle(.gray)
                .padding(.trailing, 20)
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
    
    func previousPage() {
        if currentIndex > 0 {
            currentIndex -= 1
        }
    }
}
 

