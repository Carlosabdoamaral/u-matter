//
//  HomeView.swift
//  uMatter
//
//  Created by Carlos Amaral on 09/07/22.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: Mudar o background do form
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .red
    }
    
    @State private var posts : [PostModel] = []
    @State private var didLoadData : Bool = false
    @State private var showSheet : Bool = false
    @State private var sheetPost : PostModel = PostsTemplate[0]
    
    func loadPosts() async {
//        let (data, _) = try! await URLSession.shared.data(from: URL(string:"http://localhost:8080/post/all")!)
//        let decodedResponse = try? JSONDecoder().decode([PostModel].self, from: data)
//        posts = decodedResponse ?? []
//        didLoadData = true
        return
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor").ignoresSafeArea()
                
                VStack {
                    
                    if NetworkManager().isConnected {
                        List {
                            ForEach(posts, id: \.post_id) { post in
                                NavigationLink(destination: HomeView()) {
                                    VStack(alignment: .leading) {
                                        Text(post.title)
                                            .font(.headline)
                                        
                                        Text(post.content)
                                            .font(.subheadline)
                                            .lineLimit(3)
                                    }
                                    .padding(.vertical)
                                    .onTapGesture(count: 1) {
                                        self.sheetPost = post
                                        self.showSheet = true
                                    }
                                }
                                .padding(5)
                            }
                        }
                        .task { await loadPosts() }
                        .listStyle(.plain)
                        
                    } else {
                        Text("NÃO ESTA CONECTADO")
                    }
                }
                
            }
            .navigationTitle(_texts().homeNavigation)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(Color("ToolbarItems"))
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                PostDetailsView(post: self.sheetPost)
            }
        }
        .task { await loadPosts() }
        .refreshable { await loadPosts() }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
