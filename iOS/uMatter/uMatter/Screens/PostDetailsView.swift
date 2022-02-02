//
//  PostDetailsView.swift
//  uMatter
//
//  Created by Carlos Amaral on 28/01/22.
//

import SwiftUI

struct PostDetailsView: View {
    
    var PostInfos : PostModel = PostModel(date: Date(), title: "Título", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean condimentum purus nec neque malesuada, sit amet gravida dolor ullamcorper. Aliquam semper lectus ac tellus pharetra semper. Phasellus non semper sem. Sed venenatis neque nec pellentesque iaculis. Vivamus ac ex Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean condimentum purus nec neque malesuada, sit amet gravida dolor ullamcorper. Aliquam semper lectus ac tellus pharetra semper. Phasellus non semper sem. Sed venenatis neque nec pellentesque iaculis. Vivamus ac ex Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean condimentum purus nec neque malesuada, sit amet gravida dolor ullamcorper. Aliquam semper lectus ac tellus pharetra semper. Phasellus non semper sem. Sed venenatis neque nec pellentesque iaculis. Vivamus ac ex Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean condimentum purus nec neque malesuada, sit amet gravida dolor ullamcorper. Aliquam semper lectus ac tellus pharetra semper. Phasellus non semper sem. Sed venenatis neque nec pellentesque iaculis. Vivamus ac ex Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean condimentum purus nec neque malesuada, sit amet gravida dolor ullamcorper. Aliquam semper lectus ac tellus pharetra semper. Phasellus non semper sem. Sed venenatis neque nec pellentesque iaculis. Vivamus ac ex Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean condimentum purus nec neque malesuada, sit amet gravida dolor ullamcorper. Aliquam semper lectus ac tellus pharetra semper. Phasellus non semper sem. Sed venenatis neque nec pellentesque iaculis. Vivamus ac ex")
    
    @State private var Liked : Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                ScrollView(.vertical) {
                    HStack {
                        Text(PostInfos.content)
                        Spacer()
                    }
                }
                
                Spacer()
                
                HStack {
                    
                    if Liked {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                            .onTapGesture {
                                self.Liked.toggle()
                            }
                    } else {
                        Image(systemName: "heart")
                            .onTapGesture {
                                self.Liked.toggle()
                            }
                    }
                    
                    Spacer()
                    Image(systemName: "text.bubble")
                    Spacer()
                    Image(systemName: "square.and.arrow.up")
                }
                .font(.title2)
                .padding(.horizontal)
            }
            .padding()
            .navigationTitle("\(PostInfos.title)")
            .navigationBarItems(
                trailing:
//                    ZStack {
//                        Image(systemName: "triangle.fill")
//                            .foregroundColor(.yellow.opacity(0.5))
//                            .font(.title2)
//                        Text("!")
//                            .font(.title3)
//                    }
                Text("...")
                    .font(.title)
                    .foregroundColor(.secondary)
            )
        }
    }
}

struct PostDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailsView()
    }
}
