//
//  OnboardingScreen.swift
//  ClashOfClansTracker
//
//  Created by Bruno Scheltzke on 27/10/23.
//

import SwiftUI

struct OnboardingScreen: View {
    @EnvironmentObject var store: AppMainStore

    var body: some View {
        Text("Onboarding")
        Button {
            store.dispatch(action: .completeOnboarding)
        } label: {
            Text("Complete onboarding")
        }
    }
}

#Preview {
    OnboardingScreen()
}
