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
    
    @State private var selectedTab: Tab = .map
    
    var body: some Scene {
        
        WindowGroup {
            
            VStack {
                
                switch selectedTab {
                    
                case .map:
                    NavigationView {
                        HomeView()
                    }
                case .recorded:
                    NavigationView {
                        ScreenOne()
                    }
                }
                CustomTabView(selectedTab: $selectedTab)
                    .frame(height: 50)
            }
            
            
            
            .environmentObject(vm)
        }
        
    }
    
}
