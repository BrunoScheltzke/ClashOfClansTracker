//
//  AppReducer.swift
//  ClashOfClansTracker
//
//  Created by Bruno Scheltzke on 27/10/23.
//

import Foundation

typealias AppMainStore = Store<AppState, AppAction>

enum AppState {
    case launch
    case loggedIn
    case loggedOut
    case onboarding
}

enum AppAction {
    case appOpened
    case displayOnboarding
    case completeOnboarding
    case loginTapped
    case logoutTapped
}

let appReducer: Reducer<AppState, AppAction> = { state, action in
    switch action {
    case .appOpened:
        return .launch
    case .displayOnboarding:
        return .onboarding
    case .completeOnboarding:
        return .loggedOut
    case .loginTapped:
        return .loggedIn
    case .logoutTapped:
        return .loggedOut
    }
}
