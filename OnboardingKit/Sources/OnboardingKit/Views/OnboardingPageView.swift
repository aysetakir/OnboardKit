//
//  SwiftUIView.swift
//  OnboardingKit
//
//  Created by Ayşegül takır on 12/4/26.
//

import SwiftUI

public struct OnboardingPageView<Content: View>: View {
    public let page: OnboardingPage<Content>
    
    public var body: some View {
        VStack{
            page.content
            Text(page.title)
            Text(page.description)
        }
    }
}

