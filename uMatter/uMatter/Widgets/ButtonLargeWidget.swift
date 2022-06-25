//
//  ButtonLargeWidget.swift
//  uMatter
//
//  Created by Carlos Amaral on 25/06/22.
//

import SwiftUI

struct ButtonLargeWidget: View {
    
    var text : String = "Teste"
    var action : (() -> Void)?

    
    var body: some View {
        Button {
            action
        } label: {
            Text(self.text)
        }
        .padding()
        .frame(width: UIScreen.maxWidth * 0.7)
        .background(Color.accentColor)
        .foregroundColor(.white)
        .cornerRadius(10)
    }
}

struct ButtonLargeWidget_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLargeWidget()
    }
}
