//
//  AsyncImageCahcingWithGenericJsonApiApp.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 14.12.22.
//

import SwiftUI

enum Screen {
    case one
    case two
    case home
}

final class TabRouter: ObservableObject {
    
    @Published var screen: Screen = .home
    
    func change(to screen: Screen) {
        self.screen = screen
    }
}

@main
struct AsyncImageCahcingWithGenericJsonApiApp: App {

    
    @StateObject private var vm = HomeViewModel()
    @StateObject var router = TabRouter()
    
    var body: some Scene {
        
        WindowGroup {
            
            TabView(selection: $router.screen) {
      
                    HomeView()
                        .badge(8)
                        .tag(Screen.home)
                        .environmentObject(router)  //necessary for changing  screens with a button
                    
                        .tabItem {
                            Label("SCREEN HOME", systemImage: "square.and.pencil")
                            
                        }
                    
                    ScreenOne()
                        .tag(Screen.one)
                        .tabItem {
                            Label("Screen 1", systemImage: "square.and.arrow.up.circle")
                            
                        }
                    
                    
                    
                    ScreenTwo()
                        .tag(Screen.two)
                        .environmentObject(router) // necessary for changing  screens with a button
                        .tabItem {
                            Label("Screen 2", systemImage: "trash.slash.circle")
                            
                        }
                  
                }

            .environmentObject(vm)
            }
    }
}
