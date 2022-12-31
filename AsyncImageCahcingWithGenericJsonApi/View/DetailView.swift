//
//  DetailView.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 17.12.22.
//

import SwiftUI

struct DetailView: View {
    
    //MARK: - Propeties
    
    let subject : Character
    
    //MARK: - Init
    
    init(_ subject: Character) {
        self.subject = subject
    }
    //MARK: - Body
    var body: some View {

        VStack {
            HStack(spacing: 8) {
                Text ("Your selected subject \(subject.name)")
                
            }
            HStack(spacing: 8) {
                Text("Status:")
                Text(subject.status)
                    .bold()
            }
            HStack(spacing: 8) {
                Text("Gender:")
                Text(subject.gender)
                    .bold()
            }
            HStack(spacing: 8) {
                Text("Species:")
                Text(subject.species)
                    .bold()
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(Character.init(id: 12, name: "Morty", status: "Alive", species: "Human", gender: "Male", image: "https://rickandmortyapi.com/api/character/avatar/610.jpeg"))
           
    }
}
