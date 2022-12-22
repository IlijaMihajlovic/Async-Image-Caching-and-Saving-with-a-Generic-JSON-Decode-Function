//
//  ScreenOne.swift
//  AsyncImageCahcingWithGenericJsonApi
//
//  Created by Ilija Mihajlovic on 22.12.22.
//

import SwiftUI

struct ScreenOne: View {
    @State private var query = ""
    @EnvironmentObject var router: TabRouter
    
    var body: some View {
    
        ZStack {
            Text("Screen 1")
                .bold()

            
//            Button {
//                router.change(to: .two)
//                dismiss()
//
//            } label: {
//                Text("Switch to Screen Two")
   
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.pink)
        .clipped()

    }

    
    
}

struct ScreenOne_Previews: PreviewProvider {
    static var previews: some View {
        ScreenOne()
    }
}
