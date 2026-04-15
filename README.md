# OnboardingKit

A lightweight, customizable, and easy-to-integrate onboarding library for SwiftUI apps.

## Requirements

- iOS 16+
- Swift 5.9+
- Xcode 15+

## Installation

### Swift Package Manager

1. In Xcode, select **File → Add Package Dependencies**
2. Paste the URL:
```
https://github.com/aysetakir/OnboardKit
```
3. Click **Add Package**

## Usage

```swift
import SwiftUI
import OnboardingKit

struct ContentView: View {
    var body: some View {
        OnboardingView<Image>(
            pages: [
                OnboardingPage(
                    title: "Welcome",
                    description: "This is an amazing app",
                    content: Image(systemName: "star.fill")
                ),
                OnboardingPage(
                    title: "Discover",
                    description: "Find new things every day",
                    content: Image(systemName: "magnifyingglass")
                ),
                OnboardingPage(
                    title: "Get Started",
                    description: "Let's go!",
                    content: Image(systemName: "paperplane.fill")
                )
            ],
            onFinish: {
                // Onboarding finished, navigate to main screen
            }
        )
    }
}
```

## Customization

### Colors

Customize button and indicator colors using modifiers:

```swift
OnboardingView(pages: [...], onFinish: { })
    .buttonColor(.orange)
    .buttonBackgroundColor(.clear)
    .indicatorColor(.yellow)
```

### Optional Description

`description` is optional — you can omit it:

```swift
OnboardingPage(
    title: "Welcome",
    content: Image(systemName: "star.fill")
)
```

### Custom Content

The `content` parameter is generic, so you can pass any SwiftUI View:

```swift
// Custom view
OnboardingPage(
    title: "Pick Your Interests",
    description: "Select the categories you love",
    content: CategorySelectionView()
)

// Lottie animation
OnboardingPage(
    title: "Animated",
    description: "Bring your onboarding to life",
    content: LottieView(name: "welcome")
)
```

