//
//  BaseLayoutService.swift
//  ClashOfClansTracker
//
//  Created by Bruno Scheltzke on 28/10/23.
//

import Combine
import Foundation

class BaseLayoutService {
    let bases: [BaseLayout] = [
        BaseLayout(image: "", townHall: .fourteen, link: "", category: .farming),
        BaseLayout(image: "", townHall: .fourteen, link: "", category: .defense),
        BaseLayout(image: "", townHall: .fifteen, link: "", category: .troll),
        BaseLayout(image: "", townHall: .fifteen, link: "", category: .war),
        ]

    func fetchBaseLayoutList(for townHall: TownHall) -> AnyPublisher<Result<[BaseLayout], Error>, Never> {
        return Just(.success(bases.filter { $0.townHall == townHall })).delay(for: 2, scheduler: DispatchQueue.main).eraseToAnyPublisher()
    }
}
