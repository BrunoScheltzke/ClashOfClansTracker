//
//  Store.swift
//  ClashOfClansTracker
//
//  Created by Bruno Scheltzke on 26/10/23.
//

import Combine
import Foundation

typealias Reducer<State, Action> = (State, Action) -> State
typealias Middleware<State, Action> = (State, Action) -> AnyPublisher<Action, Never>

class Store<State, Action>: ObservableObject {
    @Published private(set) var state: State
    private let reducer: Reducer<State, Action>
    private let queue = DispatchQueue(
      label: "AppMainStore",
      qos: .userInitiated)
    private let middlewares: [Middleware<State, Action>]
    private var subscriptions: Set<AnyCancellable> = []

    init(
        initialState: State,
        reducer: @escaping Reducer<State, Action>,
        middlewares: [Middleware<State, Action>]
    ) {
        self.state = initialState
        self.reducer = reducer
        self.middlewares = middlewares
    }

    func dispatch(action: Action) {
        queue.sync {
            self.dispatch(self.state, action)
        }
    }

    private func dispatch(_ currentState: State, _ action: Action) {
        let newState = reducer(currentState, action)
        middlewares.forEach { middleware in
            let publisher = middleware(newState, action)
            publisher
              .receive(on: DispatchQueue.main)
              .sink(receiveValue: dispatch)
              .store(in: &subscriptions)
        }
        state = newState
    }
}
