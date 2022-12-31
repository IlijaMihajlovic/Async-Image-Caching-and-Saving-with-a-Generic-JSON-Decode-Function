//
//  Database.swift
//  Favorites
//
//  Created by Ilija Mihajlovic on 18.12.22.
//

import Foundation

final class Database {
    
    //MARK: - Persist user favorites to database
  
    func save(items: Set<Int>) {
        let array = Array(items)
        UserDefaults.standard.set(array, forKey: FAV_KEY)
    }
    
    func load() -> Set<Int> {
        let array = UserDefaults.standard.array(forKey: FAV_KEY) as? [Int] ?? [Int]()
        return Set(array)
        
    }
}
