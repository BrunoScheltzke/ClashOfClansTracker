//
//  LoginScreen.swift
//  ClashOfClansTracker
//
//  Created by Bruno Scheltzke on 27/10/23.
//

import SwiftUI

struct LoginScreen: View {
    @EnvironmentObject var store: AppMainStore

    var body: some View {
        Text("Login")
        Button {
            store.dispatch(action: .loginTapped)
        } label: {
            Text("Complete Login")
        }
    }
}

#Preview {
    LoginScreen()
}
