//
//  HomeScreen.swift
//  ClashOfClansTracker
//
//  Created by Bruno Scheltzke on 27/10/23.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(spacing: 16), GridItem(spacing: 16), GridItem(spacing: 16)], spacing: 16) {
                    ForEach(TownHall.allCases.reversed(), id: \.rawValue) { townHall in
                        NavigationLink {
                            BaseListScreen(store: .init(initialState: .init(selectedTownHall: townHall), reducer: baseListReducer, middlewares: [baseListMiddleware()]))
                        } label: {
                            ZStack {
                                Rectangle()
                                    .foregroundStyle(.gray.opacity(0.2))
                                    .blur(radius: 3)
                                VStack {
                                    Image(townHall.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                    Text("TH\(townHall.rawValue)")
                                        .font(.headline)
                                        .foregroundStyle(.black)
                                }
                                .shadow(radius: 12)
                            }
                        }
                    }
                }
                .padding()
                .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Select a Town hall")
            }
        }
    }
}

#Preview {
    HomeScreen()
}
