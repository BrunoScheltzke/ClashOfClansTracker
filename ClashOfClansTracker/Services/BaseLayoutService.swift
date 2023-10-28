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
        BaseLayout(image: "base_th15_1", townHall: .fifteen, link: "https://link.clashofclans.com/en?action=OpenLayout&id=TH15%3AHV%3AAAAADgAAAAJjrs748qrwFUukagBDCpXF", category: .defense),
        BaseLayout(image: "war_th15_1", townHall: .fifteen, link: "https://link.clashofclans.com/en?action=OpenLayout&id=TH15%3AWB%3AAAAADgAAAAJjrt3KjoMgawkBAfhy2nkm", category: .war),
        BaseLayout(image: "progress_th15_1", townHall: .fifteen, link: "https://link.clashofclans.com/en?action=OpenLayout&id=TH15%3AHV%3AAAAADgAAAAJjrtRo6HE8XUr47uA6-Gyh", category: .progress)
        ]

    func fetchBaseLayoutList(for townHall: TownHall) -> AnyPublisher<Result<[BaseLayout], Error>, Never> {
        return Just(.success(bases.filter { $0.townHall == townHall })).delay(for: 0, scheduler: DispatchQueue.main).eraseToAnyPublisher()
    }
}
