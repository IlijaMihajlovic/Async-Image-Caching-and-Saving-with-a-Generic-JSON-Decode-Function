//
//  HomeView.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 14.12.22.
//

import SwiftUI

struct HomeViewCell: View {
    
//MARK: - Propeties
    
    var character: Character
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        
        ZStack {
            HStack {
                CachedImage(item: character.name, url: character.image, animation: .spring(), transition: .slide.combined(with: .opacity)) { phase in
                    
                    switch phase {
                        
                    case .empty:
                        ProgressView()
                        
                        // TODO: - Change Dimensions
                            .frame(width: SCREEN_SIZE.width / 3, height: 100)
                            .background(in: RoundedRectangle(cornerRadius: 8,
                                                                    style: .continuous))
                        
                    case .success(let image):
                        image
                        
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: SCREEN_SIZE.width / 4, height: 100)
                            .padding(.all, 10)
                        
                        
                        // TODO: - Improve Error Handling
                    case .failure(let error):
                        Image(systemName: "xmark")
                            .symbolVariant(.circle.fill)
                            .foregroundStyle(.white)
                            .frame(width: 100, height: 100)
                            .background(.blue, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                    @unknown default:
                        EmptyView()
                    }
                    
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text(character.name)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.black)
                    
                    
                    HStack(spacing: 8) {
                        Text("Species:")
                            .foregroundColor(.gray)
                        Text(character.species)
                            .bold()
                            .foregroundColor(.black)
                    }
                    
                    
                    HStack(spacing: 8) {
                        Text("Favorite:")
                            .foregroundColor(.gray)
                        Image(systemName: viewModel.contains(character) ? "heart.fill" : "heart")
                            .foregroundColor(.red)
                            .bold()
                            .onTapGesture {
                                viewModel.toggleFavortie(item: character)
                            }
                    }
                }
                
            }
            .font(.system(size: 14))
            .padding()
            .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity,alignment: .leading
            )
            .shadow(color: Color.black.opacity(0.2), radius: 30, x: 0, y: 0)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        colors: [Color.orange, Color.blue],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing))
                    
                .opacity(0.1)
                    
                .frame(maxWidth: .infinity, maxHeight: 130)
        }
        
        
        
       
    }
}

