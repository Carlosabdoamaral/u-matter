//
//  PersonModel.swift
//  uMatter
//
//  Created by Carlos Amaral on 24/06/22.
//

import Foundation

struct PersonModel {
    var posts : [PostModel]
    var plataform : PlataformModel
    var uuid : String
    var deletedAccount : Bool
    var blockedAccount : Bool
    var lastBlockTime : Double
    var startDate : String
    var reactions : Double
}
