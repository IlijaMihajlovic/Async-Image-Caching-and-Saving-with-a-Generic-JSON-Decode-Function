//
//  AsyncImageCahcingWithGenericJsonApiApp.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 14.12.22.
//

import SwiftUI
import PhotosUI

enum Tab {
    case map
    case recorded
}


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
 
    struct CustomTabView: View {
        @StateObject var photosModel: PhotosPickerModel = .init()
        
        @Binding var selectedTab: Tab
        
        var body: some View {
            HStack {
                Spacer()
                Button {
                    selectedTab = .map
                } label: {
                    VStack {
                        Image(systemName: "map")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        Text("Map")
                            .font(.caption2)
                    }
                    .foregroundColor(selectedTab == .map ? .blue : .primary)
                }
                .frame(width: 60, height: 50)
                Spacer()
                
                
                PhotosPicker(selection: $photosModel.selectedPhoto, matching: .any(of: [.images])) {
                    
                    ZStack {
                        Circle()
                            .foregroundColor(.secondary)
                            .frame(width: 60, height: 60)
                            .shadow(radius: 2)
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .foregroundColor(.primary)
                            .frame(width: 50, height: 50)
                        
                            .font(.callout)
                    }
                    .offset(y: -2)
                }
                
                Spacer()
                
                Button {
                    selectedTab = .recorded
                } label: {
                    VStack {
                        Image(systemName: "chart.bar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        Text("Recorded")
                            .font(.caption2)
                    }
                    .foregroundColor(selectedTab == .recorded ? .blue : .primary)
                }
                .frame(width: 60, height: 50)
                Spacer()
            }
        }
    }
    
}
