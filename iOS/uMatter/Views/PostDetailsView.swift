//
//  PostDetailsView.swift
//  uMatter
//
//  Created by Carlos Amaral on 10/07/22.
//

import SwiftUI

struct PostDetailsView: View {
    @State private var liked : Bool = false
    @State private var showingAnimation : Bool = false
    
    var post : PostModel
    
    func test() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor").ignoresSafeArea()
                
                List {
                    Text(post.date)
                        .font(.headline)
                    Text(post.content)
                        .multilineTextAlignment(.leading)
                        .font(.subheadline)
                }
                
                if showingAnimation {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200, alignment: .center)
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 0)
                        .animation(.linear, value: 1)
                        .opacity(liked ? 1 : 0)
                }
            }
            .onAppear {
                test()
            }
            .navigationTitle(post.title)
            .navigationBarTitleDisplayMode(.large)
            .onTapGesture(count: 2) {
                self.liked.toggle()
                withAnimation { showingAnimation.toggle() }
                DispatchQueue.main.asyncAfter(deadline: .now()+1) { showingAnimation.toggle() }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        self.liked.toggle()
                    } label: {
                        Image(systemName: liked ? "heart.fill" : "heart")
                            .foregroundColor(liked ? .red : Color("ToolbarItems"))
                    }
                }
            }
        }
    }
}

struct PostDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailsView(post: PostsTemplate[0])
    }
}
