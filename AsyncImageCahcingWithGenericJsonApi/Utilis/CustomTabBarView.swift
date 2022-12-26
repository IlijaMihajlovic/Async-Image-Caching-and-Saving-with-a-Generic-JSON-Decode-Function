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
            Spacer()
            
            Button {
                selectedTab = .homeButton
            } label: {
                VStack {
                    Image(systemName: "house")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
        
                    Text("Home")
                        .font(.caption2)
                }
                .foregroundColor(selectedTab == .homeButton ? .primary : .gray)
            }
            .frame(width: 50, height: 50)
            
            Spacer()
          
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
                VStack {
                    Image(systemName: "chart.bar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                    Text("Second")
                        .font(.caption2)
                }
                .foregroundColor(selectedTab == .secondScreenButton ? .primary : .gray)
            }
            .frame(width: 50, height: 50)
            .padding(20)
            Spacer()
        }
    }
}



