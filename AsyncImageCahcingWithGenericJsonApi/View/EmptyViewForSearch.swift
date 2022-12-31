//
//  EmptyViewForSearch.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 19.12.22.
//

import SwiftUI

struct EmptyViewForSearch: View {
    
    //MARK: - Properties
    
    @Binding var query: String
    @Environment(\.dismissSearch) var dismissSearch
    @EnvironmentObject var viewModel: HomeViewModel
    
    //MARK: - Body
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            HStack() {
                Text("We couldn't finde: \(query)")
                
            }
            HStack(spacing: 8) {
                
                Button("Clear Search") {
                    dismissSearch()
                    handleReset()
                }
                
            }
            
        }
    }
    
    //Show again all items
    private func handleReset() {
        query = ""
        viewModel.search()
    }
}

//MARK: - Preview
struct EmptyViewForSearch_Previews: PreviewProvider {
    static var previews: some View {
        EmptyViewForSearch(query: .constant("SDSDS"))
    }
}
