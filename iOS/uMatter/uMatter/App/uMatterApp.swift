//
//  uMatterApp.swift
//  uMatter
//
//  Created by Carlos Amaral on 27/01/22.
//

import CoreData
import SwiftUI

@main
struct uMatterApp: App {
    @AppStorage("FinishOnBoarding") var finishOnBoarding : Bool = false
    
//    @StateObject private var dataController = DataController()
    let dataContainer = DataController.shared
    
    var body: some Scene {
        WindowGroup {
            
            if finishOnBoarding {
                HomeView()
                    .environment(\.managedObjectContext, dataContainer.container.viewContext)
            } else {
                OnBoardingView()
            }
        }
    }
}
