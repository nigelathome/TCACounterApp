//
//  TCACounterAppApp.swift
//  TCACounterApp
//
//  Created by nigelli on 2022/7/14.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCACounterAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                store:Store(initialState: Counter(), reducer: counterReducer, environment: counterEnvironmet())
                )
        }
    }
}
