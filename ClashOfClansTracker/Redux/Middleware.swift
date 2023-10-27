//
//  Middleware.swift
//  ClashOfClansTracker
//
//  Created by Bruno Scheltzke on 27/10/23.
//

import Combine
import Foundation

func loginMiddleware(auth: Auth = .init()) -> Middleware<AppState, AppAction> {
    { state, action in
        switch action {
        case .appOpened:
            if !auth.hasSeenOnboarding() {
                return Just(.displayOnboarding).eraseToAnyPublisher()
            }
            // attempt automatic login
            return Just(.logoutTapped).delay(for: 2, scheduler: DispatchQueue.main).eraseToAnyPublisher()
        case .completeOnboarding:
            auth.setOnboardingAsSeen()
        default: break
        }
        return Empty().eraseToAnyPublisher()
    }
}
