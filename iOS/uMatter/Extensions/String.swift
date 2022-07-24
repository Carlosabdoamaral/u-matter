//
//  String.swift
//  uMatter
//
//  Created by Carlos Amaral on 09/07/22.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString( self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
