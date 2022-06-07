//
//  PostDetailsView.swift
//  uMatter
//
//  Created by Carlos Amaral on 28/01/22.
//

import SwiftUI

struct PostDetailsView: View {
    @State private var liked : Bool = false
    @State private var commented : Bool = false
    
    var post : Post!
    
    var body: some View {
        NavigationView {
            
            VStack {
                List {
                    Section { Text(self.post.content!
                    ) } header: { }
                }
                .listStyle(.insetGrouped)
                    
                HStack {
                    Button {
                        self.liked.toggle()
                    } label: {
                        self.liked ? Image(systemName: "heart.fill") : Image(systemName: "heart")
                    }
                    
                    Spacer()
                    
                    Button {
                    } label: {
                        Image(systemName: "paperplane")
                    }
                }
                .font(.system(size: 20))
                .padding()
                .padding(.horizontal)
            }
            .navigationTitle(self.post.title!)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup {
                    NavigationLink {
                        ReportPostView()
                    } label: {
                        Image(systemName: "exclamationmark.triangle")
                            .foregroundColor(.red)
                    }

                }
            }
        }
    }
}

struct PostDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailsView()
    }
}
