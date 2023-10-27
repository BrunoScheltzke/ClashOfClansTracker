//
//  Store.swift
//  ClashOfClansTracker
//
//  Created by Bruno Scheltzke on 26/10/23.
//

import Foundation

class Store<State, Action>: ObservableObject {
    @Published private(set) var state: State
    private let reducer: Reducer<State, Action>
    private let queue = DispatchQueue(
      label: "AppMainStore",
      qos: .userInitiated)

    init(
        initialState: State,
        reducer: @escaping Reducer<State, Action>
    ) {
        self.state = initialState
        self.reducer = reducer
    }

    func dispatch(action: Action) {
        queue.sync {
            self.dispatch(self.state, action)
        }
    }

    private func dispatch(_ currentState: State, _ action: Action) {
      let newState = reducer(currentState, action)
      state = newState
    }
}

typealias Reducer<State, Action> = (State, Action) -> State
