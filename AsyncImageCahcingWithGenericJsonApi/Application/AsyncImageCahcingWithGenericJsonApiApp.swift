//
//  AsyncImageCahcingWithGenericJsonApiApp.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 14.12.22.
//

import SwiftUI

@main
struct AsyncImageCahcingWithGenericJsonApiApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    @State private var selectedTab: CustomTabBar = .homeButton
    
    var body: some Scene {
        
        WindowGroup {
            
            VStack {
                
                switch selectedTab {
                    
                case .homeButton:
                    NavigationView {
                        HomeView()
                    }
                case .secondScreenButton:
                    NavigationView {
                        ScreenOne()
                    }
                }
                CustomTabBarView(selectedTab: $selectedTab)
                    .frame(height: 30)
            }
            
            
            
            .environmentObject(vm)
        }
        
    }
    
}
