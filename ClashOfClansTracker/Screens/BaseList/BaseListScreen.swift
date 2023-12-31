//
//  BaseListScreen.swift
//  ClashOfClansTracker
//
//  Created by Bruno Scheltzke on 27/10/23.
//

import SwiftUI

struct BaseListScreen: View {
    @StateObject var store: BaseListStore

    var body: some View {
        ScrollView {
            if store.state.isLoading {
                ProgressView()
            }
            else if store.state.filteredBases.isEmpty {
                Text("emptybaselist")
            } else {
                LazyVGrid(columns: [GridItem()]) {
                    ForEach(store.state.filteredBases, id: \.self) { base in
                        NavigationLink {
                            BaseDetailScreen(base: base)
                        } label: {
                            VStack(spacing: 2) {
                                Image(base.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 200)
                                    .shadow(radius: 10)
                                HStack {
                                    Text(base.category.text)
                                        .foregroundStyle(.gray)
                                    Spacer()
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
        }
        .navigationTitle("bestbasesforth\(store.state.selectedTownHall.rawValue)")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Menu("filter") {
                    Button {
                        store.dispatch(action: .cleanFilter)
                    } label: {
                        Text("reset")
                    }
                    Divider()
                    ForEach(BaseCategory.allCases, id: \.self) { category in
                        Button {
                            store.dispatch(action: .setFilter(category))
                        } label: {
                            Text(category.text)
                        }
                    }
                }
            }
        }
        .onAppear() {
            store.dispatch(action: .getBaseList)
        }
    }
}

#Preview {
    BaseListScreen(store: .init(initialState: .init(selectedTownHall: .fifteen), reducer: baseListReducer, middlewares: [baseListMiddleware()]))
}
