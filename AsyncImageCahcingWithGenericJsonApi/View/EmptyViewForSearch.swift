//
//  EmptyViewForSearch.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 19.12.22.
//

import SwiftUI

struct EmptyViewForSearch: View {
    
    @Binding var query: String
    @Environment(\.dismissSearch) var dismissSearch
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
   
        HStack() {
            Text("We couldn't finde: \(query)")
            
            Spacer()
            
            Button("Clear Search") {
            dismissSearch()
            handleReset()
        }
            Spacer()
      
        }
    }
    
    //Show again all items
    private func handleReset() {
        query = ""
        viewModel.search()
    }
}

struct EmptyViewForSearch_Previews: PreviewProvider {
    static var previews: some View {
        EmptyViewForSearch(query: .constant("ASDADTFD"))
    }
}
