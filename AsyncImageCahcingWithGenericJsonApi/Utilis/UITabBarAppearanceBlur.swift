//
//  UITabBarAppearanceBlur.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 23.12.22.
//

import UIKit
import SwiftUI

// Add inside the .onApper modifier
func tabBarBlueAppearanceHelper() {
    let appearance = UITabBarAppearance()
    appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
    appearance.backgroundColor = UIColor(Color.orange.opacity(0.2))

    // Use this appearance when scrolling behind the TabView:
    UITabBar.appearance().standardAppearance = appearance
    // Use this appearance when scrolled all the way up:
    UITabBar.appearance().scrollEdgeAppearance = appearance
}

