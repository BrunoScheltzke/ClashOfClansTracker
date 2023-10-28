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
            LazyVGrid(columns: [GridItem(spacing: 64)]) {
                if filteredBases.isEmpty {
                    Text("emptybaselist")
                } else {
                    ForEach(filteredBases, id: \.self) { base in
                        NavigationLink {
                            //RestaurantDetailsView(restaurant: restaurant)
                        } label: {
                            VStack {
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
        .navigationTitle("bestbasesforth\(townHall.rawValue)")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
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
            }
        }
    }
}

#Preview {
    BaseLayoutScreen(townHall: .fifhteen)
}
