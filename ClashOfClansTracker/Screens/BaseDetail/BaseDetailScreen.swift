//
//  BaseDetailScreen.swift
//  ClashOfClansTracker
//
//  Created by Bruno Scheltzke on 28/10/23.
//

import SwiftUI

struct BaseDetailScreen: View {
    @Environment(\.openURL) var openURL
    let base: BaseLayout
    var body: some View {
        VStack {
            Image(base.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
                .shadow(radius: 20)
            Text(base.category.text)
            Spacer()
            if let url = URL(string: base.link) {
                PillButton(image: "arrow.right", title: "Open in game") {
                    openURL(url)
                }
            } else {
                Text("Link temporarily unavailable")
            }
        }
        .padding()
    }
}

#Preview {
    BaseDetailScreen(base: .init(image: "base_th15_1", townHall: .fifteen, link: "www.google.com", category: .defense))
}
