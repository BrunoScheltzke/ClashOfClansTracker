//
//  AppReducer.swift
//  ClashOfClansTracker
//
//  Created by Bruno Scheltzke on 27/10/23.
//

import Foundation

typealias AppMainStore = Store<AppState, AppAction>

enum AppAction {
    case appOpened
    case displayOnboarding
    case completeOnboarding
    case logoutTapped
    case completeLogin(user: User)
}

let appReducer: Reducer<AppState, AppAction> = { state, action in
    var mutatingState = state
    switch action {
    case .appOpened:
        mutatingState.loginState = .attemptingAutomaticLogin
    case .displayOnboarding:
        mutatingState.loginState = .firstTime
    case .completeOnboarding:
        mutatingState.loginState = .loggedOut
    case .logoutTapped:
        mutatingState.loginState = .loggedOut
    case .completeLogin(user: let user):
        mutatingState.loginState = .loggedIn(user: user)
    }
    return mutatingState
}
