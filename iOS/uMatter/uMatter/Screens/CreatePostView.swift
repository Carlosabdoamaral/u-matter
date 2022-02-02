//
//  CreatePostView.swift
//  uMatter
//
//  Created by Carlos Amaral on 28/01/22.
//

import SwiftUI

struct CreatePostView: View {
    @AppStorage("isCreatingPost") var isCreatingPost : Bool = false
    @State private var postTitle : String = ""
    @State private var postContent : String = ""
    
    @State private var ColorsArr : [Color] = [.blue.opacity(0.4), .green.opacity(0.4), .red.opacity(0.4), .pink.opacity(0.4)]
    @State private var Gradient : LinearGradient = LinearGradient(colors: [.blue.opacity(0.4), .accentColor.opacity(0.8) ], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    init() { UITextView.appearance().backgroundColor = .clear }
    
    var body: some View {
        ZStack {
            VStack {
                
                VStack(alignment: .center) {
                    Text("Create your post")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(width: UIScreen.maxWidth - 140)
                        .multilineTextAlignment(.center)
                }
                .frame(width: UIScreen.maxWidth, height: UIScreen.maxHeight - 600)
                .background(Gradient)
                
                
                TextField("your title...", text: $postTitle)
                    .padding()
                    .background(.gray.opacity(0.2))
                    .cornerRadius(15)
                    .padding([.top, .horizontal])
                
                TextEditor(text: $postContent)
                    .padding()
                    .background(.gray.opacity(0.2))
                    .cornerRadius(15)
                    .padding()
                
                Spacer()
                
                HStack {
                    
                    Button {
                        
                    } label: {
                        Text("Cancel")
                            .onTapGesture {
                                self.isCreatingPost = false
                            }
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Post")
                            .fontWeight(.semibold)
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 50)
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .cornerRadius(5)

                }
                .padding(.horizontal)
            }
        }
    }
}

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView()
    }
}
