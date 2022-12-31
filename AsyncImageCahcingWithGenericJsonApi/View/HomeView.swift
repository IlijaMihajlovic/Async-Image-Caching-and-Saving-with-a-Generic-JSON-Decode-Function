//
//  HomeView.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 14.12.22.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - Properties
    
    @StateObject var viewModel = HomeViewModel()
    @State private var query = ""
    
    
    //MARK: - Init
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.gray]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.customLightGray]
        
    }
    
    //MARK: - Body
    var body: some View {
        
        NavigationStack() {
            
            ScrollView(showsIndicators: false) {
                
                LazyVStack {
                    
                    ForEach(viewModel.filteredData, id: \.id) { character in
                        
                        NavigationLink(value: character) {
                            HomeViewCell(character: character)
                            
                        }
                        
                    }
                    
                    .alert("", isPresented: $viewModel.hasError) {} message: {
                        Text(viewModel.errorMessage)
                    }
                    
                }
                
                .searchable(text: $query,placement: .navigationBarDrawer, prompt: "Find a person")
                
                .navigationTitle("Rick & Morty")
                
                .navigationDestination(for: Character.self) { dest in
                    
                    DetailView(dest) // TODO: - Improve
                    
                }
                
            }
            
            .task {
                await viewModel.fetchCharacters()
                viewModel.search()
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
        .accentColor(.gray)
    }
}

