//
//  CachedImageManager.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 13.12.22.
//

import Foundation

final class CachedImageManager: ObservableObject {
    
    @Published private(set) var currentState: CurrentState?
    
    private let imageRetriver = ImageRetriver()
    
    @MainActor
    func load(_ item: String, url: String,cache: ImageCache = .shared) async {
        
        self.currentState = .loading
        
        if let imageData = cache.object(forkey: item as NSString) {
            self.currentState = .success(data: imageData)
            #if DEBUG
            print("📱 Fetching image from the cache: \(item)")
            #endif
            return
        }
        
        do {
            let data = try await imageRetriver.fetch(url)
            self.currentState = .success(data: data)
            cache.set(object: data as NSData,
                      forKey: item as NSString)
            
            FileStorageManger.shared.save(.init(name: item, data: data))
            
            #if DEBUG
            print("📱 Caching image: \(url)")
            #endif
        } catch {
            self.currentState = .failed(error: error)
        }
    }
}

extension CachedImageManager {
    enum CurrentState {
        case loading
        case failed(error: Error)
        case success(data: Data)
    }
}

extension CachedImageManager.CurrentState: Equatable {
    static func == (lhs: CachedImageManager.CurrentState,
                    rhs: CachedImageManager.CurrentState) -> Bool {
       
        switch (lhs, rhs) {
        
        case (.loading, .loading):
            return true
        case (let .failed(lhsError), let .failed(rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        case (let .success(lhsData), let .success(rhsData)):
            return lhsData == rhsData
        
        default:
            return false
        }
    }
}
