//
//  PostModel.swift
//  uMatter
//
//  Created by Carlos Amaral on 28/01/22.
//

import Foundation

struct PostModel : Identifiable, Codable {
    var id = UUID()
    let date : Date
    let title : String
    let content : String
}
