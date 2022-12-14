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
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .environmentObject(vm)
            }
           
        }
    }
}
