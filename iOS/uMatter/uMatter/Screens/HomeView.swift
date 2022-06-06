//
//  HomeView.swift
//  uMatter
//
//  Created by Carlos Amaral on 28/01/22.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("languageId") var languageId : Int = 0
    @AppStorage("isCreatingPost") private var isCreatingPost : Bool = false
    @State private var isShowingPostDetails : Bool = false
    @State private var NavigationViewTitleText : String = "Home"
    
    func CreatePost() {
        self.isCreatingPost.toggle()
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        
                        VStack {
                            ForEach(0..<10) { i in
                                Divider()
                                PostComponent(
                                    PostInfos: PostTemplate,
                                    ImageColorIndex: Int.random(in: 0..<13),
                                    ImageIndex: Int.random(in: 0..<9)
                                )
                                .sheet(isPresented: $isShowingPostDetails) {
                                    PostDetailsView(PostInfos: PostTemplate)
                                }
                                .onTapGesture {
                                    self.isShowingPostDetails.toggle()
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Home")
            .navigationBarItems(
                trailing:
                    HStack {
                        Image(systemName: "plus")
                            .onTapGesture(perform: CreatePost)
                            .sheet(isPresented: $isCreatingPost, onDismiss: {
                                self.isCreatingPost = false
                            }) {
                                CreatePostView()
                            }
                    }
            )
        }
//        .onTapGesture {
//            CheckLanguage()
//        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
