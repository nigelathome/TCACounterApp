//
//  RootState.swift
//  TCACounterApp
//
//  Created by nigelli on 2022/7/28.
//

import Combine
import ComposableArchitecture
import SwiftUI

struct RootState: Equatable {
    var countState = Counter()
//    var counterDetail = Counter(count: 0)
}

enum RootAction {
    case counterAction(CounterAction)
}

struct RootEnvironment {}

let rootReducer = Reducer<
    RootState,
    RootAction,
    RootEnvironment
>.combine(
    counterReducer.pullback(
        state: \.countState,
        action: /RootAction.counterAction,
        environment: {_ in .init()}
    ),

    Reducer { state, action, _ in
        switch action {
            case .counterAction:
                return .none
        default:
            return .none
        }
    }
)
