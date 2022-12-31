//
//  CustomTabBarButton.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 31.12.22.
//

import SwiftUI

struct CustomTabBarButton: View {
    
    var buttonText: String
    var imageName: String
    var isActive: Bool
    
    var body: some View {
        
        GeometryReader { geo in
            
            if isActive {
                
                Rectangle()
                    .foregroundColor(.orange)
                // Puts the select recntagle in the middel
                    .frame(width: geo.size.width/2, height: 4)
                    .padding(.leading, geo.size.width/4)
            }
            
            VStack(alignment: .center, spacing: 4) {
                
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .padding(.top)
                
                
                Text(buttonText)
                    .font(.caption2)
            }
            
            .frame(width: geo.size.width, height: geo.size.height)
        }
        
        
    
        
    }
}

struct CustomTabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarButton(buttonText: "Home", imageName: "chart.bar", isActive: true)
    }
}

