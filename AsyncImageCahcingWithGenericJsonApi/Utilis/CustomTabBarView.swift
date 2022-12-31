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
                
                
                .foregroundColor(selectedTab == .homeButton ? .primary : .gray)
            }
            
            PhotosPicker(selection: $photosModel.selectedPhoto, matching: .any(of: [.images]), photoLibrary: .shared()) {
                
                ZStack(alignment: .center) {
                    Circle()
                        .foregroundColor(.secondary)
                        .frame(width: 60, height: 60)
                        .shadow(radius: 2)
                    
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .foregroundColor(.primary)
                        .frame(width: 60, height: 60)
                    
                    
                        .font(.callout)
                }
                .offset(y: -2)
            }
            
            Spacer()
            
            Button {
                selectedTab = .secondScreenButton
                
            } label: {
                
                CustomTabBarButton(buttonText: "Second", imageName: "chart.bar", isActive: selectedTab == .secondScreenButton)
                
                .foregroundColor(selectedTab == .secondScreenButton ? .primary : .gray)
            }
            
        }
        .frame(height: 60)
    }
}

struct CustomTabBarView_Preview: PreviewProvider {
    
    static var previews: some View {
        CustomTabBarView(selectedTab: .constant(.homeButton))
    }
}



