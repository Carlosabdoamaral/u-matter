//
//  HomeView.swift
//  uMatter
//
//  Created by Carlos Amaral on 24/06/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.posts, id: \.post_id) { post in
                    NavigationLink(destination: PostDetailsView(p: post)) {
                        HStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 5)
                                .foregroundColor(.accentColor)
                            
                            VStack(alignment: .leading) {
                                Text(post.title)
                                    .font(.headline)
                                
                                Text(post.content)
                                    .font(.footnote)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(3)
                            }
                        }
                    }
                }
                .refreshable {
                    await viewModel.loadPosts()
                }
                .listStyle(.plain)
                .task { await viewModel.loadPosts() }
            }
            .navigationTitle(NavigationTitleClass().home)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.primary)
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
