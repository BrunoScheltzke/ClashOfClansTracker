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
        TabView {
            HomeScreen()
                .tabItem {
                    Label("home", systemImage: "house")
                }
            SettingsScreen()
                .tabItem {
                    Label("settings", systemImage: "gearshape")
                }
        }
    }
}

#Preview {
    RootScreen()
}
