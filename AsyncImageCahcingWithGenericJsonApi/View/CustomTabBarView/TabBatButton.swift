//
//  TabBatButton.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 22.12.22.
//

import SwiftUI

struct TabBatButton: View {
    
    var buttonText: String
    var imageName: String
    var isActive: Bool
    
    var body: some View {
        
        GeometryReader { geo in
            
            if isActive {

                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: geo.size.width/2, height: 4)
                    .padding(.leading, geo.size.width/4)
            }
            
            VStack(alignment: .center, spacing: 4) {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                
                Text(buttonText)
                    .font(.title3)
            }
            .frame(width: geo.size.width, height: geo.size.height)
            
        }
        
    }
}

struct TabBatButton_Previews: PreviewProvider {
    static var previews: some View {
        TabBatButton(buttonText: "Chats", imageName: "bubble.left", isActive: true)
    }
}
