//
//  LanguageSquareComponent.swift
//  uMatter
//
//  Created by Carlos Amaral on 27/01/22.
//

import SwiftUI

struct LanguageSquareComponent: View {
    
    var language : String = ""
    var color : Color = Color.red
    @State var isSelected : Bool = true
    
    var body: some View {
        VStack {
            
            if isSelected == true {
                Text("\(self.language)")
                    .font(.title)
                    .fontWeight(.semibold)
                    .background(self.color)
                    .foregroundColor(.white)
                    .lineLimit(1)
            } else {
                Text("\(self.language)")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .lineLimit(1)
            }
        }
        .frame(width: 100, height: 100)
        .background(.white)
        .cornerRadius(5)
        .shadow(color: .black, radius: 1, x: 0, y: 0)
    }
}

struct LanguageSquareComponent_Previews: PreviewProvider {
    static var previews: some View {
        LanguageSquareComponent()
    }
}
