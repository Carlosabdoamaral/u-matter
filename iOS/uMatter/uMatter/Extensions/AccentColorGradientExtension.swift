//
//  AccentColorGradient.swift
//  uMatter
//
//  Created by Carlos Amaral on 28/01/22.
//

import Foundation
import SwiftUI

func AccentColorGradient() -> LinearGradient {
    return LinearGradient(
        colors: [Color.accentColor.opacity(0.4), Color.accentColor.opacity(0.8)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}
