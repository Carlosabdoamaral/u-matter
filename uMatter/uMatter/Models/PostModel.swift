//
//  PostModel.swift
//  uMatter
//
//  Created by Carlos Amaral on 24/06/22.
//

import Foundation

struct PostModel : Decodable {
    var post_id : Int
    var title : String
    var content : String
    var date : String
    var reactions : Int
    var views : Int
}
