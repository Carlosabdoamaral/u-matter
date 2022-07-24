//
//  AuthView.swift
//  uMatter
//
//  Created by Carlos Amaral on 10/07/22.
//

import SwiftUI

struct AuthView: View {
    @ObservedObject var authentication: AuthenticationManager = AuthenticationManager()
    let text = _texts()
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            
            VStack {
                Text("uMatter")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                Spacer()
                
                Button {
                    authentication.requestBiometricUnlock()
                } label: {
                    Text(text.authButton)
                }
                .frame(width: 250)
                .padding()
                .background(.blue)
                .cornerRadius(5)
                .foregroundColor(.white)
                .padding()
            }
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
            .colorScheme(.dark)
    }
}
