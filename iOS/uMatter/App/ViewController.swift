//
//  ViewController.swift
//  uMatter
//
//  Created by Carlos Amaral on 10/07/22.
//

import SwiftUI

struct ViewController: View {
    @StateObject var authentication = AuthenticationManager()
    
    var body: some View {
        if authentication.appUnlocked {
            HomeView()
        } else {
            AuthView()
        }
    }
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewController()
    }
}
