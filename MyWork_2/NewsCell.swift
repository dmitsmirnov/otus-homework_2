//
//  NewsCell.swift
//  MyWork_2
//
//  Created by dmitsmirnov on 27.06.2022.
//

import SwiftUI

struct NewsCell: View {
    
    var title: String
    var titleMain: String
    
    //@Binding var offsetCell: Bool
    //@State var searchText = ""
    @State var offsetCell: Bool = false
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.mint)
            VStack {
                
                Text(title)
                    .foregroundColor(.black)
                    .padding()
                    //.searchable(text: $searchText, prompt: "Look for something")
                    .navigationTitle(titleMain)
                
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        
        .offset(x: self.offsetCell ? 700 : 0)
        
        .onTapGesture {
            withAnimation(Animation.easeOut(duration: 0.7)) {
                self.offsetCell = true
            }
            withAnimation(Animation.easeOut(duration: 3)) {
                self.offsetCell = false
            }
        }
    }
}



//struct NewsCell_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsCell(title: "", titleMain: "")
//    }
//}


