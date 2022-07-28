//
//  EditCountCore.swift
//  TCACounterApp
//
//  Created by nigelli on 2022/7/28.
//

import SwiftUI
import ComposableArchitecture

struct CounterDetailState: Equatable {
    var counterDetail: Counter
}

enum CounterDetailAction {
    case counterView(CounterAction)
}

struct CounterDetailEnvironment {
}

let counterDetailReducer: Reducer<CounterDetailState, CounterDetailAction, CounterDetailEnvironment> = .combine(
    counterReducer.pullback(
        state: \.counterDetail,
        action: /CounterDetailAction.counterView,
        environment: {_ in .init()}
    )
)
