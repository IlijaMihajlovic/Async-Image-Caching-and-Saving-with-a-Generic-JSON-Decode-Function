//
//  HomeView.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 14.12.22.
//

import SwiftUI

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
                
                .searchable(text: $query,placement: .navigationBarDrawer, prompt: "Find a person")
    
                
                .alert("", isPresented: $viewModel.hasError) {} message: {
                    Text(viewModel.errorMessage)
                }
            }
           
            .navigationTitle("Rick & Morty API")
        
            .navigationBarTitleDisplayMode(.automatic)
            
            .navigationDestination(for: Character.self) { dest in
                
                DetailView(dest) // TODO: - Improve
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


