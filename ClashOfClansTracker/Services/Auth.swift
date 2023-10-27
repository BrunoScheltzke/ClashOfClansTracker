//
//  Auth.swift
//  ClashOfClansTracker
//
//  Created by Bruno Scheltzke on 27/10/23.
//

import Foundation
import KeychainAccess

// TODO: wrap with a protocol
class Auth {
    private let userDefaults: UserDefaults = .standard
    private let keychain = Keychain()
    private let hasSeenKey = "hasSeenKey"

    func hasSeenOnboarding() -> Bool {
        userDefaults.bool(forKey: hasSeenKey)
    }

    func setOnboardingAsSeen() {
        userDefaults.setValue(true, forKey: hasSeenKey)
    }

    func attemptExistingLogin() {
        
    }

    func login(username: String, password: String) {

    }

    func removeLocalCredentials() {

    }

    private func storeLoginCredentials(username: String, password: String) {

    }
}
