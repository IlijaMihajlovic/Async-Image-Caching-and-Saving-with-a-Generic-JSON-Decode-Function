//
//  CachedImage.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 13.12.22.
//

import SwiftUI

struct CachedImage<Content: View>: View {
    
    @StateObject private var manager = CachedImageManager()
    
    let item: String
    let url: String
    let animation: Animation?
    let transition: AnyTransition
    let content: (AsyncImagePhase) -> Content
    
    init(item: String, url: String,
         animation: Animation? = nil,
         transition: AnyTransition = .identity,
         @ViewBuilder content: @escaping (AsyncImagePhase) -> Content) {
        self.item = item
        self.url = url
        self.animation = animation
        self.transition = transition
        self.content = content
    }
    
    
    var body: some View {
        ZStack {
          
            switch manager.currentState {
            case .loading:
                content(.empty)
                    .transition(transition)
            case .success(let data):
                if let image = UIImage(data: data) {
                    content(.success(Image(uiImage: image)))
                        .transition(transition)
                } else {
                    content(.failure(CachedImageError.invalidData))
                        .transition(transition)
                }
            case .failed(let error):
                content(.failure(error))
                    .transition(transition)
            default:
                content(.empty)
                    .transition(transition)
            }
        }
        .animation(animation, value: manager.currentState)
        .task {
            await manager.load(item, url: url)
        }
    }
}

struct CachedImage_Previews: PreviewProvider {
    static var previews: some View {
        CachedImage(item: "", url: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/RedDot_Burger.jpg/600px-RedDot_Burger.jpg" ) { _ in EmptyView() }
    }
}

extension CachedImage {
    enum CachedImageError: Error {
        case invalidData
    }
}
