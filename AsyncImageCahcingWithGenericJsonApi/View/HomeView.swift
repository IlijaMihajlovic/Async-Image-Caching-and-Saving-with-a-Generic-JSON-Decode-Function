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
                    
               
                
                .alert("", isPresented: $viewModel.hasError) {} message: {
                    Text(viewModel.errorMessage)
                }
                    
            }
            
            .searchable(text: $query,placement: .navigationBarDrawer, prompt: "Find a person")
            
            .navigationTitle("Rick & Morty API")
            
            .navigationDestination(for: Character.self) { dest in
                
                DetailView(dest) // TODO: - Improve
                
            }
            
            
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



struct FloatingButton: View {
    @State var translation = CGSize.zero
    
    var fillColor = LinearGradient(
        colors: [Color.orange, Color.blue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    
    var overlayImage = Image(systemName: "plus")
    
    
    var body: some View {
        ZStack {
            Circle()
                .fill(fillColor)
                .overlay(overlayImage)
                .offset(x: translation.width, y: translation.height)
                .frame(width: 50, height: 50)
                .gesture(
                    DragGesture()
                        .onChanged({ (value) in
                            self.translation = value.translation
                        })
                        .onEnded({ (value) in
                            self.translation = CGSize.zero
                        })
                )
                .animation(.interpolatingSpring(stiffness: 40, damping: 40))
            Button(action: {
                print("Cliked")
            }, label: {
                Text("+")
            })
            
            
        }
    }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


