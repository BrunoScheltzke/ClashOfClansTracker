//
//  ClashOfClansTracker.swift
//  Chef
//
//  Created by Bruno Scheltzke on 24/10/23.
//

import SwiftUI

struct PillButton: View {
    let image: String
    let title: String
    let onButtonPressed: () -> Void

    var body: some View {
        Button {
            onButtonPressed()
        } label: {
            HStack {
                Text(title)
                Image(systemName: image)
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
            .font(.title3)
            .fontWeight(.bold)
            .background(Color.accentColor)
            .foregroundStyle(.white)
            .clipShape(.capsule)
            .shadow(radius: 10)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PillButton(image: "cart", title: "Adicionar ao carrinho", onButtonPressed: {})
}
