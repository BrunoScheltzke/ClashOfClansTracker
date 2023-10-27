//
//  BaseLayoutScreen.swift
//  ClashOfClansTracker
//
//  Created by Bruno Scheltzke on 27/10/23.
//

import SwiftUI

struct BaseLayoutScreen: View {
    let townHall: TownHall
    @State private var filter: BaseCategory?
    var bases: [BaseLayout] { [
        BaseLayout(image: townHall.image, townHall: townHall, link: "", category: .farming),
        BaseLayout(image: townHall.image, townHall: townHall, link: "", category: .defense),
        BaseLayout(image: townHall.image, townHall: townHall, link: "", category: .troll),
        BaseLayout(image: townHall.image, townHall: townHall, link: "", category: .war),
        ]
    }

    var filteredBases: [BaseLayout] {
        guard let filter else { return bases }
        return bases.filter { $0.category == filter }
    }
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Menu("filter") {
                        Button {
                            filter = nil
                        } label: {
                            Text("reset")
                        }
                        Divider()
                        ForEach(BaseCategory.allCases, id: \.self) { category in
                            Button {
                                filter = category
                            } label: {
                                Text(category.text)
                            }
                        }
                    }
                    Spacer()
                }
                .padding()
                LazyVGrid(columns: [GridItem()]) {
                    if filteredBases.isEmpty {
                        Text("emptybaselist")
                    } else {
                        ForEach(filteredBases, id: \.self) { base in
                            NavigationLink {
                                //RestaurantDetailsView(restaurant: restaurant)
                            } label: {
                                HStack {
                                    Image(base.image)
                                        .resizable()
                                        .frame(width: 100, height: 80)
                                        .clipShape(.circle)
                                    Text(base.category.text)
                                        .tint(.black)
                                    Spacer()
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("bestbasesforth\(townHall.rawValue)")
    }
}

#Preview {
    BaseLayoutScreen(townHall: .fifhteen)
}
