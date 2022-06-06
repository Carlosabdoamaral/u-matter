//
//  PostComponent.swift
//  uMatter
//
//  Created by Carlos Amaral on 28/01/22.
//

import SwiftUI

struct PostComponent: View {    
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
                    .background(colorsTemplate[ImageColorIndex].opacity(0.4))
                    .cornerRadius(50)
                    .foregroundColor(colorsTemplate[ImageColorIndex])
                
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
                        .onTapGesture { self.liked.toggle() }
                        .foregroundColor(.primary)
                } else {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                        .onTapGesture { self.liked.toggle() }
                }
                
                Spacer()
                Image(systemName: "text.bubble")
                    .foregroundColor(.primary)
                
                Spacer()
                
                Image(systemName: "paperplane")
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
