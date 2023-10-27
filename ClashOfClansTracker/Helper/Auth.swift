//
//  Auth.swift
//  ClashOfClansTracker
//
//  Created by Bruno Scheltzke on 27/10/23.
//

import Combine
import Foundation
import KeychainAccess

func loginMiddleware() -> Middleware<AppState, AppAction> {
    { state, action in
        switch action {
        case .appOpened:
            if !Auth().hasSeenOnboarding() {
                return Just(.displayOnboarding).eraseToAnyPublisher()
            }
            // attempt automatic login
            return Just(.logoutTapped).delay(for: 2, scheduler: DispatchQueue.main).eraseToAnyPublisher()
        case .completeOnboarding:
            Auth().setOnboardingAsSeen()
        default: break
        }
        return Empty().eraseToAnyPublisher()
    }
}

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
