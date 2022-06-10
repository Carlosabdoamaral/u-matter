//
//  HomeView.swift
//  uMatter
//
//  Created by Carlos Amaral on 28/01/22.
//

import SwiftUI
import CloudKit

struct HomeView: View {
//    @AppStorage("languageId") var languageId : Int = 0
    @AppStorage("isCreatingPost") private var isCreatingPost : Bool = false
    @AppStorage("isShowingPostDetails") var isShowingPostDetails : Bool = false
    
    @State private var NavigationViewTitleText : String = "Home"
    @State private var isShowingMessage : Bool = false
    
    //MARK: REMOVER e puxar de um db
    @FetchRequest(sortDescriptors: []) var posts : FetchedResults<Post>
    
    func CreatePost() { self.isCreatingPost.toggle() }
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        VStack {
                            ForEach(posts) { p in
                                Divider()
                                PostComponent(
                                    PostInfos: p,
                                    ImageColorIndex: Int.random(in: 0..<13),
                                    ImageIndex: Int.random(in: 0..<9)
                                )
                                .sheet(isPresented: $isShowingPostDetails) {
                                    PostDetailsView(post: p)
                                }
                                .onTapGesture {
                                    self.isShowingPostDetails.toggle()
                                }
                            }
                        }
                    }
                }
                .sheet(isPresented: $isShowingMessage) {
                    self.isCreatingPost = false
                } content: {
                    DailyMessageView()
                }

            }
            .navigationTitle("uMatter")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        self.isShowingMessage = true
                    } label: {
                        Image(systemName: "text.bubble")
                    }
                    Image(systemName: "plus")
                    .onTapGesture(perform: CreatePost)
                    .sheet(isPresented: $isCreatingPost, onDismiss: {
                        self.isCreatingPost = false
                    }) {
                        CreatePostView()
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        Image(systemName: "person.fill")
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
