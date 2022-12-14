//
//  FileStorageManager.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 13.12.22.
//

import Foundation

final class FileStorageManger {
    
    static let shared = FileStorageManger()
    private let fileManger = FileManager.default
    
    private var cacheFolderUrl: URL? {
        fileManger.urls(for: .cachesDirectory, in: .userDomainMask)
            .first
    }
    
    private init() {}
    
    
    func retrive(with fileName: String) -> Item? {
        guard let cacheFolder = cacheFolderUrl else { return nil }
        
        
        // Path where to save the file in the cache folder
        let fileURL = cacheFolder.appendingPathComponent(fileName + ".cache")
        
        
        //Read the content of the file and convert ot into data
        guard let data = try? Data(contentsOf: fileURL),
            
            let item = try? JSONDecoder().decode(Item.self, from: data) else {
            
            #if DEBUG
            print("Failed to get file \(fileName) from disk")
            #endif
            
            return nil
                
            }
            
            #if DEBUG
            print("Succesfully got file \(fileName) from disk")
            #endif
        
            return item
    }
    
    func save(_ item: Item) {
        
        guard let cacheFolder = cacheFolderUrl else { return }
                
        let fileURL = cacheFolder.appendingPathComponent(item.name + ".cache")
        
        
        #if DEBUG
        print(" Creating path for file -> \(fileURL.absoluteString)")
        #endif
        
        
        //MARK: Save Data do Device
        do {
            
            let data = try JSONEncoder().encode(item)
            try data.write(to: fileURL)
            
            #if DEBUG
            print("SAved item to disk with name \(item.name)")
            #endif
            
            
        } catch {
            #if DEBUG
            print(error)
            #endif
        }
        
    }
    
    
}

extension FileStorageManger {
    
    struct Item: Codable {// Item for Saving
        let name: String // Key for the Item
        let data: Data
    }
}
