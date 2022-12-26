//
//  ScreenTwo.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 22.12.22.
//

import SwiftUI

struct ScreenTwo: View {
    




    var body: some View {
        ZStack {

            Button {
            
            } label: {
              
                Text("Switch to Screen one")
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.yellow)
        .clipped()

        
//        onAppear {
//            dismissSearch()
//            dismiss()
//        }
    }
        
}

struct ScreenTwo_Previews: PreviewProvider {
    static var previews: some View {
        ScreenTwo()
           
    }
}
