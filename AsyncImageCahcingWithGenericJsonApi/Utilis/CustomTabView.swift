//
//  CustomTabView.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 26.12.22.
//

import SwiftUI
import PhotosUI


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
            
          
            PhotosPicker(selection: $photosModel.selectedPhoto, matching: .any(of: [.images]), photoLibrary: .shared()) {
                
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



