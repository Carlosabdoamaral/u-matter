//
//  uMatterApp.swift
//  uMatter
//
//  Created by Carlos Amaral on 27/01/22.
//

import SwiftUI

@main
struct uMatterApp: App {
    @AppStorage("FinishOnBoarding") var finishOnBoarding : Bool = false
    
    var body: some Scene {
        WindowGroup {
            
            if finishOnBoarding {
                TabView {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Menu")
                        }
                    
                    SettingsView()
                        .tabItem {
                            Image(systemName: "gear")
                            Text("Settings")
                        }
                }
            } else {
                OnBoardingView()
            }
        }
    }
}
