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
	
    private let client = Client()
	
    @Published private(set) var characters: [Character] = []
	@Published private(set) var errorMessage: String = ""
	@Published var hasError: Bool = false
    
    
    @Published var showingFavs = false
    @Published var savedItems: Set<Int> = [1, 7]
    
    
    var request: URLRequest = {
        let urlString = "\(BASE_URL)/character"
        let url = URL(string: urlString)!
        return URLRequest(url: url)
    }()
    
    
    var filteredItems: [Character]  {
               if showingFavs {
                   return characters.filter { savedItems.contains($0.id) }
               }
               return characters
           }
           
    
    private var db = Database()
            
            init() {
                self.savedItems = db.load()
                //self.characters = Character.sampleItems
            }
            
            func sortFavs() {
                withAnimation() {
                    showingFavs.toggle()
                }
            }
            
            func contains(_ item: Character) -> Bool {
                    savedItems.contains(item.id)
                }
    

        // Toggle saved items
        func toggleFav(item: Character) {
            if contains(item) {
                savedItems.remove(item.id)
            } else {
                savedItems.insert(item.id)
            }
            db.save(items: savedItems)
        }
    



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
