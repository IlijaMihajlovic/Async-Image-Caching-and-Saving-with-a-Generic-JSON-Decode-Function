//
//  HomeViewModel.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 14.12.22.
//

import Foundation
import SwiftUI


@MainActor 
final class HomeViewModel: ObservableObject {
    
    @Published private(set) var characters: [Character] = []
    @Published private(set) var errorMessage: String = ""
    @Published var hasError: Bool = false
    
    @Published var showingFavortie = false
    @Published var savedItems: Set<Int> = []
    
    private let client = Client()
    private var db = Database()
    
    
    var request: URLRequest = {
        let urlString = URL_TO_API
        let url = URL(string: urlString)!
        return URLRequest(url: url)
    }()
    
    // MARK: - Filter and Favorite Items
    
    var filteredItems: [Character]  {
        if showingFavortie {
            return characters.filter { savedItems.contains($0.id) }
        }
        return characters
    }
 
    
    init() {
        self.savedItems = db.load()
        //self.characters = Character.sampleItems
    }
    
    func sortFavorite() {
        withAnimation() {
            showingFavortie.toggle()
        }
    }
    
    func contains(_ item: Character) -> Bool {
        savedItems.contains(item.id)
    }
    
    // TODO: - Improve 
    func toggleFavortie(item: Character) {
        if contains(item) {
            savedItems.remove(item.id)
        } else {
            savedItems.insert(item.id)
        }
        db.save(items: savedItems)
    }
    
    //MARK: - Feth decoded Data
    
    func fetchCharacters() async {
        do {
            let response = try await client.fetch(type: Characters.self, with: request)
            characters = response.results.compactMap { $0 }
        } catch {
            errorMessage = "\((error as! ApiError).customDescription)"
            hasError = true
        }
    }
}
