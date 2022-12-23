//
//  ScreenTwo.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 22.12.22.
//

import SwiftUI

struct ScreenTwo: View {
    
    //necessary only for changing screens with a button
    @EnvironmentObject var router: TabRouter


    var body: some View {
        ZStack {

            Button {
            router.change(to: .one)
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
            .environmentObject(TabRouter())
    }
}
