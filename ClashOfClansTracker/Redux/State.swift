//
//  File.swift
//  ClashOfClansTracker
//
//  Created by Bruno Scheltzke on 27/10/23.
//

import Foundation

struct AppState {
    var loginState: LoginState
}

enum LoginState {
    case loggedIn(user: User)
    case loggedOut
    case attemptingAutomaticLogin // attemps to automatically log in when opening the app
    case firstTime // first time opening the app. Mainly for displaying the onboarding screen
}
