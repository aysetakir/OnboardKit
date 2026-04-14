//
//  SwiftUIView.swift
//  OnboardingKit
//
//  Created by Ayşegül takır on 12/4/26.
//

import SwiftUI

public struct OnboardingPageView<Content: View>: View {
    public let page: OnboardingPage<Content>
    
    public init(page: OnboardingPage<Content>) {
        self.page = page
    }
    
    public var body: some View {
        VStack {
            Spacer()
            page.content
            Spacer()
            Text(page.title)
            if let description = page.description {
                Text(description)
            }
        }
    }
}
