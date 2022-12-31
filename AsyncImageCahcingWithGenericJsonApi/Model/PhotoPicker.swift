//
//  PhotoPicker.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 26.12.22.
//

import SwiftUI

struct PhotoPicker: Identifiable {
    
    var id: String = UUID().uuidString
    var image: Image
    var data: Data
}
