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
        
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.characters, id: \.id) { character in
                        
                        HomeViewCell(character: character)
                        
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
