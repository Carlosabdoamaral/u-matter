//
//  PostComponent.swift
//  uMatter
//
//  Created by Carlos Amaral on 28/01/22.
//

import SwiftUI

struct PostComponent: View {
    
    @State private var icons : [String] = ["sparkles","heart.fill","bolt.heart.fill","ear.fill","arrow.up.heart.fill","sun.max.fill","sunrise.fill","sun.haze.fill","moon.stars.fill","paintpalette.fill"]
    
    @State private var ColorsArr : [Color] = [.blue, .brown, .cyan, .gray, .green, .indigo, .mint, .orange, .pink, .purple, .primary, .red, .teal, .yellow ]
    
    @State private var liked : Bool = false
    
    var PostInfos : PostModel = PostModel(date: Date(), title: "Title", content: "Content")
    var ImageColorIndex : Int = 2
    var ImageIndex : Int = 2
    
    var body: some View {
        VStack(alignment: .leading) {
            
            //MARK: TOP POST
            HStack(alignment: .center) {
                Image(systemName: icons[ImageIndex])
                    .padding()
                    .background(ColorsArr[ImageColorIndex].opacity(0.4))
                    .cornerRadius(50)
                    .foregroundColor(ColorsArr[ImageColorIndex])
                
                VStack(alignment: .leading) {
                    Text(PostInfos.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    HStack {
                        Image(systemName: "calendar")
                        Text("\(PostInfos.date)")
                            .lineLimit(1)
                    }
                    .font(.footnote)
                    .foregroundColor(.secondary)
                }
                Spacer()
            }
            
            
            //MARK: CONTENT POST
            Text(PostInfos.content)
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .lineLimit(4)
                .foregroundColor(.primary)
            
            //ACTIONS
            HStack {
                if !liked {
                    Image(systemName: "heart")
                        .onTapGesture {
                            self.liked.toggle()
                        }
                        .foregroundColor(.primary)
                } else {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                        .onTapGesture {
                            self.liked.toggle()
                        }
                }
                
                Spacer()
                Image(systemName: "text.bubble")
                    .foregroundColor(.primary)
                Spacer()
                Image(systemName: "square.and.arrow.up")
                    .foregroundColor(.primary)
            }
            .padding(.top, 5)
            
            
        }
        .padding()
    }
}

struct PostComponent_Previews: PreviewProvider {
    static var previews: some View {
        PostComponent()
            .previewLayout(.sizeThatFits)
    }
}
