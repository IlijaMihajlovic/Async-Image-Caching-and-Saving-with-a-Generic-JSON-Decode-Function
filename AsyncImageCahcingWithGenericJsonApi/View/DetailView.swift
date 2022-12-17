//
//  DetailView.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 17.12.22.
//

import SwiftUI

struct DetailView: View {
    
    let subject : Character
    
    init(_ subject: Character) {
        self.subject = subject
    }
    
    var body: some View {
        
        Text("Your are in Detail view")
        
        Text ("Your selected subject \(subject.name)")
 
    }
}


