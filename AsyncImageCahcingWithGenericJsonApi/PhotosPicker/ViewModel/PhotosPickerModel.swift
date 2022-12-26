//
//  PhotosPickerModel.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 26.12.22.
//

import SwiftUI
import PhotosUI

class PhotosPickerModel: ObservableObject {
    
    @Published var selectedPhoto: PhotosPickerItem?
}
