//
//  AuthenticationManager.swift
//  uMatter
//
//  Created by Carlos Amaral on 10/07/22.
//

import Foundation
import SwiftUI
import LocalAuthentication

class AuthenticationManager: ObservableObject {
    @Published var appUnlocked = false
    @Published var authorizationError: Error?
    
    func requestBiometricUnlock() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "reasonAuthentication".localized()

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { sucess, authenticationError in
                if sucess {
                    print("Authentication done")
                    self.appUnlocked = true
                } else {
                    print("Something went wrong")
                }
            }

        } else {
            appUnlocked = true
            print("No biometry")
        }
    }
    
}
