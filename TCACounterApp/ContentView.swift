//
//  ContentView.swift
//  TCACounterApp
//
//  Created by nigelli on 2022/7/14.
//

import SwiftUI
import ComposableArchitecture

struct Counter : Equatable {
    var count: Int = 0
}

extension Counter {
    var countString : String {
        get {String(count)}
        set {count = Int(newValue) ?? count}
    }
}

enum CounterAction {
    case increment
    case reset
    case setString(String)
    case decrement
}

struct counterEnvironmet {}


let counterReducer = Reducer<Counter, CounterAction, counterEnvironmet> {
    state, action, _ in
    switch action {
    case .increment:
        state.count += 1
        return .none
    case .decrement:
        state.count -= 1
        return .none
    case .reset:
        state.count = 0
        return .none
    case .setString(let text):
        state.countString = text
        return .none
    }
}.debug()

struct ContentView: View {
    let store: Store<Counter, CounterAction>
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack{
                HStack{
                    Button("+"){
                        viewStore.send(.increment)
                    }
                    TextField(
                        String(viewStore.count),
                        text: viewStore.binding(
                        get : \.countString,
                        send: CounterAction.setString
                        )
                        )
                        .frame(width: 40)
                        .foregroundColor(colorOfCount(count: viewStore.count))

                    Button("-"){
                        viewStore.send(.decrement)
                    }
                    Button("复位"){
                        viewStore.send(.reset)
                    }
                }
//                NavigationLink("edit count", destination: EditCountentView())
                NavigationLink("Edit Count", destination: {
                    EditCountentView(store: store.scope(
                        state: \.counterDetail, action: CounterDetailAction.counterView
                    ))
                })
            }

        }
    }

    func colorOfCount(count: Int) -> Color {
        count > 0 ? .red : .blue
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            store:Store(initialState: Counter(), reducer: counterReducer, environment: counterEnvironmet())
        )
    }
}
