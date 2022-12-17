//
//  HomeView.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 14.12.22.
//

import SwiftUI

struct HomeView: View {
   
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        
        NavigationStack() {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.characters, id: \.id) { character in

                        NavigationLink(value: character) {
                            HomeViewCell(character: character)
                        }
                    }
                }
                .padding()
                
                .task {
                    await viewModel.fetchCharacters()
                }
                .alert("", isPresented: $viewModel.hasError) {} message: {
                    Text(viewModel.errorMessage)
                }
            }
            .navigationTitle("Rick & Morty API")
            .navigationBarTitleDisplayMode(.automatic)
            .navigationDestination(for: Character.self) { dest in
                DetailView(dest)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
