//
//  State.swift
//  ClashOfClansTracker
//
//  Created by Bruno Scheltzke on 28/10/23.
//

import Combine
import Foundation

struct BaseListState {
    var selectedTownHall: TownHall
    var bases = [BaseLayout]()
    var filteredBases = [BaseLayout]()
    var filter: BaseCategory?
    var isLoading: Bool = false
}

enum BaseListAction {
    case getBaseList
    case setBaseList([BaseLayout])
    case setFilter(BaseCategory)
    case cleanFilter
}

typealias BaseListStore = Store<BaseListState, BaseListAction>

let baseListReducer: Reducer<BaseListState, BaseListAction> = { state, action in
    var mutatingState = state
    switch action {
    case .getBaseList:
        mutatingState.isLoading = true
    case .setBaseList(let baseList):
        mutatingState.isLoading = false
        mutatingState.bases = baseList
        mutatingState.filteredBases = baseList
    case .setFilter(let category):
        mutatingState.filteredBases = mutatingState.bases.filter { $0.category == category }
        mutatingState.filter = category
    case .cleanFilter:
        mutatingState.filteredBases = mutatingState.bases
        mutatingState.filter = nil
    }
    return mutatingState
}

func baseListMiddleware(service: BaseLayoutService = .init()) -> Middleware<BaseListState, BaseListAction> {
    { state, action in
        switch action {
        case .getBaseList:
            return service.fetchBaseLayoutList(for: state.selectedTownHall)
                .compactMap { result -> BaseListAction? in
                    var bases = [BaseLayout]()
                    if case .success(let baseList) = result {
                        bases = baseList
                    }
                    return BaseListAction.setBaseList(bases)
                }
                .eraseToAnyPublisher()
        default: break
        }
        return Empty().eraseToAnyPublisher()
    }
}
