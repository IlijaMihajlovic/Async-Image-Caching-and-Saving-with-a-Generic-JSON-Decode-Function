//
//  CustomTabView.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 26.12.22.
//

import SwiftUI
import PhotosUI


struct CustomTabBarView: View {
    
    @StateObject var photosModel: PhotosPickerViewModel = .init()
    @Binding var selectedTab: CustomTabBar
    
    var body: some View {
        
        HStack {
            
            Button {
                selectedTab = .homeButton
            } label: {
                
                CustomTabBarButton(buttonText: "Home", imageName: "house", isActive: selectedTab == .homeButton)
                
                
                    .foregroundColor(selectedTab == .homeButton ? .newCustomLightOrange : .gray)
            }
            
            PhotosPicker(selection: $photosModel.selectedPhoto, matching: .any(of: [.images]), photoLibrary: .shared()) {
                
                ZStack(alignment: .center) {
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 60, height: 60)
                        .shadow(radius: 4)
                    
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .foregroundColor(.newCustomLightOrange)
                        .frame(width: 60, height: 60)
                    
                    
                        .font(.callout)
                }
                .offset(y: -2)
            }
            
            
            
            Button {
                
                selectedTab = .secondScreenButton
                
            } label: {
                
                CustomTabBarButton(buttonText: "Second", imageName: "chart.bar", isActive: selectedTab == .secondScreenButton)
                
                .foregroundColor(selectedTab == .secondScreenButton ? .newCustomLightOrange : .gray)
            }
         
        }
        // Disable keyboard avoidance. Bug still exists
        .ignoresSafeArea(.keyboard, edges: .all)
        .frame(height: 50)
    
        
    }
    
}

struct CustomTabBarView_Preview: PreviewProvider {
    
    static var previews: some View {
        CustomTabBarView(selectedTab: .constant(.homeButton))
    }
}



