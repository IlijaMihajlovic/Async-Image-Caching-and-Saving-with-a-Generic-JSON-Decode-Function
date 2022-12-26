//
//  PhotosPickerModel.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 26.12.22.
//

import SwiftUI
import PhotosUI

class PhotosPickerModel: ObservableObject {
    
    @Published var loadedImage: [PhotoPickerModel] = []
    
    @Published var selectedPhoto: PhotosPickerItem? {
        didSet {
            
            if let selectedPhoto {
                processPhoto(photo: selectedPhoto)
                
            }
        }
    }
    
    func processPhoto(photo: PhotosPickerItem) {
        
        photo.loadTransferable(type: Data.self) { result in
            
            DispatchQueue.main.async {
                
                switch result {
                    
                case .success(let data):
                    
                    if let data, let image = UIImage(data: data) {
                        print("Image Found")
                        
                        self.loadedImage.append(.init(image: Image(uiImage: image), data: data))
                        
                    }
                    
                case .failure(let failure):
                    print(failure)
                }
            }
        }
    }
}
