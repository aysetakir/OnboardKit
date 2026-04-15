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
    public var buttonColor: Color = .accentColor
    public var buttonBackgroundColor: Color = .accentColor
    public var indicatorColor: Color = .accentColor
    public var onFinish: () -> Void
    
    public init(pages: [OnboardingPage<Content>],onFinish: @escaping () -> Void) {
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
            PageIndicatorView(pageCount: pages.count, currentIndex: currentIndex)
                .indicatorColor(indicatorColor)
            HStack {
                Button {
                    previousPage()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(buttonColor)
                        .padding()
                        .background(buttonBackgroundColor)
                        .clipShape(.circle)
                }
                .opacity(isFirstPage ? 0 : 1)
                .disabled(isFirstPage)
                
                Spacer()
                
                Button {
                    nextPage()
                } label: {
                    Image(systemName: "chevron.right")
                        .foregroundStyle(buttonColor)
                        .padding()
                        .background(buttonBackgroundColor)
                        .clipShape(.circle)
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
    
    func buttonColor(_ color: Color) -> OnboardingView<Content> {
        var view = self
        view.buttonColor = color
        return view
    }
    
    func buttonBackgroundColor(_ color: Color) -> OnboardingView<Content> {
        var view = self
        view.buttonBackgroundColor = color
        return view
    }
    
    func indicatorColor(_ color: Color) -> OnboardingView<Content> {
        var view = self
        view.indicatorColor = color
        return view
    }
}
