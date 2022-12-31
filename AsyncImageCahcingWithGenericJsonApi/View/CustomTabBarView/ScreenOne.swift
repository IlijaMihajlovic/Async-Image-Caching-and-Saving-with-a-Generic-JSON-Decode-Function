//
//  ScreenOne.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 22.12.22.
//

import SwiftUI
import PhotosUI

struct ScreenOne: View {
    
   @State var myImage: Image
    
    @EnvironmentObject var viewModel: HomeViewModel

    var body: some View {

        NavigationStack {
            ZStack {
                Text("Screen 1")
                    .bold()
                
                ForEach(viewModel.filteredData, id: \.id) { character in
                    
                    Image()
                        
                    }
                
            }
            
        }
    }
}

struct ScreenOne_Previews: PreviewProvider {
    static var previews: some View {
        ScreenOne()
    }
}
