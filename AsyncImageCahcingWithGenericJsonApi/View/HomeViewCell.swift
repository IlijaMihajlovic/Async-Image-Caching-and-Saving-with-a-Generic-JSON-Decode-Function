//
//  HomeView.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 14.12.22.
//

import SwiftUI

struct HomeViewCell: View {
    
    var character: Character
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .fill(.cyan)
                .opacity(0.4)
                .frame(height: 130) // TODO: Change Dimensions
            
            HStack {
                CachedImage(item: character.name, url: character.image, animation: .spring(), transition: .slide.combined(with: .opacity)) { phase in
                    
                    switch phase {
                        
                    case .empty:
                        ProgressView()
                        
                        // TODO: - Change Dimensions
                            .frame(width: SCREEN_SIZE.width / 3, height: 120)
                            .background(.blue, in: RoundedRectangle(cornerRadius: 8,
                                                                    style: .continuous))
                        
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: SCREEN_SIZE.width / 3, height: 110)
                            .padding()
                            .background(.blue, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                    
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
                   
                    HStack(spacing: 8) {
                        Text("Status:")
                        Text(character.status)
                            .bold()
                    }
                    HStack(spacing: 8) {
                        Text("Gender:")
                        Text(character.gender)
                            .bold()
                    }
                    HStack(spacing: 8) {
                        Text("Species:")
                        Text(character.species)
                            .bold()
                    }
                }
                .font(.system(size: 14))
                .padding()
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .leading
                )
                Spacer()
            }
            .frame(height: 120)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}

struct HomeViewCell_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewCell(character: Character(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", gender: "Male", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
    }
}
