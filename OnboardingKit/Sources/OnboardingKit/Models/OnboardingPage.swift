//
//  OnboardingPage.swift
//  OnboardingKit
//
//  Created by Ayşegül takır on 12/4/26.
//

import SwiftUI

@available(iOS 16.0, macOS 10.15, *)
public struct OnboardingPage<Content: View> {
    public var title: String
    public var description: String
    public var content: Content
}


