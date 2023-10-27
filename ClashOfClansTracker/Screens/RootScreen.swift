//
//  RootScreen.swift
//  ClashOfClansTracker
//
//  Created by Bruno Scheltzke on 27/10/23.
//

import SwiftUI

struct RootScreen: View {
    @EnvironmentObject var store: AppMainStore

    var body: some View {
        Text("Root")
        Button {
            store.dispatch(action: .logoutTapped)
        } label: {
            Text("Logout")
        }
    }
}

#Preview {
    RootScreen()
}
