//
//  HomeView.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 14.12.22.
//

import SwiftUI
import UIKit

struct HomeView: View {
    
    
    @StateObject var viewModel = HomeViewModel()
    @State private var query = ""
    
    var body: some View {
        
        NavigationStack() {
     
            
            ScrollView(showsIndicators: false) {
                
                LazyVStack {
                    
                    ForEach(viewModel.filteredData, id: \.id) { character in
                        
                        NavigationLink(value: character) {
                            HomeViewCell(character: character)
                            
                            
                        }
                        
                    }

                }
                .padding()

                .alert("", isPresented: $viewModel.hasError) {} message: {
                    Text(viewModel.errorMessage)
                }
            }
            
            .searchable(text: $query,placement: .navigationBarDrawer, prompt: "Find a person")
            
            .navigationBarTitleDisplayMode(.automatic)
            
            .navigationTitle("Rick & Morty API")
       
            
            .navigationDestination(for: Character.self) { dest in
                
                DetailView(dest) // TODO: - Improve
                
            }
            

        }
 
        
       

        .onAppear {
            tabBarBlueAppearanceHelper()
        }
        
        .task {
            await viewModel.fetchCharacters()
            viewModel.search()
        }
        
        
        .onSubmit(of: .search) {
            viewModel.search(with: query)
        }
        
        .onChange(of: query) { newQuery in
            viewModel.search(with: newQuery)
        }
        
        .overlay {
            
            if viewModel.filteredData.isEmpty {
                EmptyViewForSearch(query: $query)
                
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


