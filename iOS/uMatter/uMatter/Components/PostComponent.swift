//
//  PostComponent.swift
//  uMatter
//
//  Created by Carlos Amaral on 28/01/22.
//

import SwiftUI

struct PostComponent: View {    
    @State private var liked : Bool = false
    @State var PostInfos : Post
    
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
                    Text(PostInfos.title ?? "Loading...")
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
//                    HStack {
//                        Image(systemName: "calendar")
//                        Text("\(PostInfos.date!)")
//                            .lineLimit(1)
//                    }
//                    .font(.footnote)
//                    .foregroundColor(.secondary)
                }
                Spacer()
            }
            
            
            //MARK: CONTENT POST
            Text(PostInfos.content ?? "Loading...")
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .lineLimit(4)
                .foregroundColor(.primary)
        }
        .padding()
    }
}

//struct PostComponent_Previews: PreviewProvider {
//    @StateObject private var dataController = DataController()
//    var post : Post = Post(context: self.dataController)
//    post.n
//    
//    static var previews: some View {
//        PostComponent(
//        )
//            .previewLayout(.sizeThatFits)
//            .environment(\.managedObjectContext, dataController.container.viewContext)
//    }
//}
