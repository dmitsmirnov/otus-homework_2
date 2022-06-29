//
//  ContentView.swift
//  MyWork_2
//
//  Created by dmitsmirnov on 23.06.2022.
//

import SwiftUI
//import NewsNetwork

struct ContentView: View {
    
    var body: some View {
        NewsScreen()
            .environmentObject(NewsViewModel())
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//my key
// U4GK01MVu3TAXceJs0FtDr4e4wk15odRTfEu5q1fW4rm4f0j
// https://api.currentsapi.services/v1/latest-news?language=en&apiKey=U4GK01MVu3TAXceJs0FtDr4e4wk15odRTfEu5q1fW4rm4f0j
