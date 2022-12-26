//
//  Mediafile.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 26.12.22.
//

import SwiftUI

struct MediaFile: Identifiable {
    
    var id: String = UUID().uuidString
    var image: Image
    var data: Data
}
