import SwiftUI
import NewsNetwork

extension News: Identifiable {
    public var id: String { url }
}

final class NewsViewModel: ObservableObject {
    
    @Published var listType = 0
    var listTypes = ["Sports", "Finance", "Movie"]
    
    @Published var articlesSports: [News] = .init()
    @Published var articlesFinance: [News] = .init()
    @Published var articlesMovie: [News] = .init()
    
    init() {
        
        let apikey = "U4GK01MVu3TAXceJs0FtDr4e4wk15odRTfEu5q1fW4rm4f0j"
        
        NewsAPI.latestNewsGet(language: "en",
                              apiKey: apikey,
                              category: "sports") {list, error in
            self.articlesSports = list?.news ?? []
        }
        
        NewsAPI.latestNewsGet(language: "en",
                              apiKey: apikey,
                              category: "finance") {list, error in
            self.articlesFinance = list?.news ?? []
        }
        
        NewsAPI.latestNewsGet(language: "en",
                              apiKey: apikey,
                              category: "movie") {list, error in
            self.articlesMovie = list?.news ?? []
        }
        
    }
    
}

struct NewsScreen: View {
    
    @EnvironmentObject var newsViewModel: NewsViewModel
    
    var body: some View {
        
        VStack {
            
            Picker("List", selection: $newsViewModel.listType) {
                ForEach(0..<newsViewModel.listTypes.count) { index in
                    Text(newsViewModel.listTypes[index])
                        .tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            NavigationView {
                switch newsViewModel.listType {
                case 0:
                    listSport
                case 1:
                    listFinance
                case 2:
                    listMove
                default:
                    EmptyView()
                }
            }
        }.padding(.top, 30)
    }
    
    //@State var offset = false
    @State var isActive = false
    //@State var offsetCell = false
    
    var listSport: some View {
        VStack {
            List(newsViewModel.articlesSports) { article in
                NavigationLink(destination: DescriptionScreen(destination: article.description!,
                                                              author: article.author!), isActive: $isActive) {
                    NewsCell(title: article.title!,
                    //         titleMain: newsViewModel.listTypes[newsViewModel.listType], offsetCell: $offsetCell)
                             titleMain: newsViewModel.listTypes[newsViewModel.listType])
                }
            }
            .listStyle(.grouped)
            
            .onTapGesture {
                DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                    self.isActive = true
                    //self.offsetCell = true
                }
            }
        }
    }
    
    var listFinance: some View {
        
        VStack{
            List(newsViewModel.articlesFinance) { article in
                NavigationLink(destination: DescriptionScreen(destination: article.description!,
                                                              author: article.author!), isActive: $isActive) {
                    NewsCell(title: article.title!, titleMain: newsViewModel.listTypes[newsViewModel.listType])
                }
            }
            .listStyle(.grouped)
            
            .onTapGesture {
                DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                    self.isActive = true
                    //self.offsetCell = true
                }
            }
        }
        
    }
    
    var listMove: some View {
        
        VStack{
            List(newsViewModel.articlesMovie) { article in
                NavigationLink(destination: DescriptionScreen(destination: article.description!,
                                                              author: article.author!), isActive: $isActive) {
                   NewsCell(title: article.title!, titleMain: newsViewModel.listTypes[newsViewModel.listType])
                }
            }
            .listStyle(.grouped)
            
            .onTapGesture {
                DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                    self.isActive = true
                    //self.offsetCell = true
                }
            }
        }
    }
    
}

//struct NewsScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsScreen()
//    }
//}
