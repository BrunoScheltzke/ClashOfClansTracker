//
//  ClashOfClansTrackerApp.swift
//  ClashOfClansTracker
//
//  Created by Bruno Scheltzke on 26/10/23.
//

import SwiftUI

@main
struct ClashOfClansTrackerApp: App {
    @StateObject var appMainStore: AppMainStore = AppMainStore(initialState: .init(loginState: .attemptingAutomaticLogin), reducer: appReducer, middlewares: [loginMiddleware()])

    var body: some Scene {
        WindowGroup {
            VStack {
                switch appMainStore.state.loginState {
                case .attemptingAutomaticLogin:
                    LaunchScreen()
                case .loggedIn:
                    RootScreen()
                case .loggedOut:
                    LoginScreen()
                case .firstTime:
                    OnboardingScreen()
                }
            }
            .onAppear() {
                appMainStore.dispatch(action: .appOpened)
            }
            .environmentObject(appMainStore)
        }
    }
}
