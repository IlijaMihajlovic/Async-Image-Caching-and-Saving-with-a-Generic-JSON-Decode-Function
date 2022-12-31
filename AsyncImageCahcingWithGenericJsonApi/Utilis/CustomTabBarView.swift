//
//  CustomTabView.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 26.12.22.
//

import SwiftUI
import PhotosUI


struct CustomTabBarView: View {
    
   // @StateObject var photosModel: PhotosPickerViewModel = .init()
    @StateObject var photosModel = PhotosPickerViewModel()
    
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
                        .foregroundColor(.white)
                        .frame(width: 60, height: 60)
                        .shadow(radius: 4)
                    
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .foregroundColor(.primary)
                        .frame(width: 60, height: 60)
                    
                    
                        .font(.callout)
                }
                .offset(y: -2)
            }
            
            
            
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



