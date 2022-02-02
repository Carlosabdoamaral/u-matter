//
//  HomeView.swift
//  uMatter
//
//  Created by Carlos Amaral on 28/01/22.
//

import SwiftUI

//MARK: OBS
//Language ID = 0 -> Ingles
//Language ID = 1 -> Portugues
//Language ID = 2 -> Espanhol
//Language ID = 3 -> Frances

struct HomeView: View {
    @AppStorage("languageId") var languageId : Int = 0
    @AppStorage("isCreatingPost") private var isCreatingPost : Bool = false
    
    @State private var isShowingPostDetails : Bool = false
    @State private var NavigationViewTitleText : String = "Home"
    let PostTemplate : PostModel = PostModel(date: Date(), title: "Título template", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean condimentum purus nec neque malesuada, sit amet gravida dolor ullamcorper. Aliquam semper lectus ac tellus pharetra semper. Phasellus non semper sem. Sed venenatis neque nec pellentesque iaculis. Vivamus ac ex Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean condimentum purus nec neque malesuada, sit amet gravida dolor ullamcorper. Aliquam semper lectus ac tellus pharetra semper. Phasellus non semper sem. Sed venenatis neque nec pellentesque iaculis. Vivamus ac ex Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean condimentum purus nec neque malesuada, sit amet gravida dolor ullamcorper. Aliquam semper lectus ac tellus pharetra semper. Phasellus non semper sem. Sed venenatis neque nec pellentesque iaculis. Vivamus ac ex Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean condimentum purus nec neque malesuada, sit amet gravida dolor ullamcorper. Aliquam semper lectus ac tellus pharetra semper. Phasellus non semper sem. Sed venenatis neque nec pellentesque iaculis. Vivamus ac ex Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean condimentum purus nec neque malesuada, sit amet gravida dolor ullamcorper. Aliquam semper lectus ac tellus pharetra semper. Phasellus non semper sem. Sed venenatis neque nec pellentesque iaculis. Vivamus ac ex Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean condimentum purus nec neque malesuada, sit amet gravida dolor ullamcorper. Aliquam semper lectus ac tellus pharetra semper. Phasellus non semper sem. Sed venenatis neque nec pellentesque iaculis. Vivamus ac ex")
    
    func CreatePost() {
        self.isCreatingPost.toggle()
    }
    
    func GoToInfos() {
        
    }
    
    func CheckLanguage() {
        if languageId == 0 {
            // Already done
        } else if languageId == 1 {
            self.NavigationViewTitleText = "Menu"
        } else if languageId == 2 {
            
        }
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
                            .sheet(isPresented: $isCreatingPost) {
                                CreatePostView()
                            }
                    }
            )
        }
        .onTapGesture {
            CheckLanguage()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
