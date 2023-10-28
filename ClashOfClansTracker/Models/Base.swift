//
//  Base.swift
//  ClashOfClansTracker
//
//  Created by Bruno Scheltzke on 27/10/23.
//

import Foundation

enum BaseCategory: CaseIterable {
    case war
    case farming
    case defense
    case troll
    case progress

    var text: String { String(describing: self) }
}

struct BaseLayout: Hashable {
    let image: String
    let townHall: TownHall
    let link: String
    let category: BaseCategory
}

enum TownHall: Int, CaseIterable {
    case one = 1
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case eleven
    case twelve
    case thirteen
    case fourteen
    case fifteen

    var image: String { "th\(rawValue)" }
}
