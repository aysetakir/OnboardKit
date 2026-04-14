//
//  OnboardingPage.swift
//  OnboardingKit
//
//  Created by Ayşegül takır on 12/4/26.
//

import SwiftUI
 
public struct OnboardingPage<Content: View> {
    public var title: String
    public var description: String
    public var content: Content
}

public init(title: String, description: String, content: Content) {
    self.title = title
    self.description = description
    self.content = content
}
