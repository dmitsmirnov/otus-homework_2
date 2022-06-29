//
//  DescriptionScreen.swift
//  MyWork_2
//
//  Created by dmitsmirnov on 26.06.2022.
//

import SwiftUI

struct DescriptionScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var destination: String
    var author: String
    
    var body: some View {
        VStack(spacing: 50) {
            
            Text(destination)
                .font(.system(size: 20))
                .foregroundColor(.black)
                .padding()
                
            Text(author)
                .font(.title)
                .foregroundColor(.gray)
                .padding()
            
        }
    }
}

struct DescriptionScreen_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionScreen(destination: "", author: "")
    }
}
