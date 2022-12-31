//
//  ScreenOne.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 22.12.22.
//

import SwiftUI
import PhotosUI

struct ScreenOne: View {
    //@StateObject var photosModel: PhotosPickerViewModel = .init()
    @StateObject var photosModel = PhotosPickerViewModel()
   
    var body: some View {
        
        ZStack {
            Text("Screen 1")
                .bold()
            
            
        }
    }
    
     
    
}

struct ScreenOne_Previews: PreviewProvider {
    static var previews: some View {
        ScreenOne()
    }
}
