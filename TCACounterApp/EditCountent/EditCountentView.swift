//
//  EditCountentView.swift
//  TCACounterApp
//
//  Created by nigelli on 2022/7/28.
//

import SwiftUI
import ComposableArchitecture


struct EditCountentView: View {
    let store: Store<CounterDetailState, CounterDetailAction>
//    @State var count = ""
    var body: some View {
        Text("111")
//        WithViewStore(store) {ViewStore in
//            TextField("", text: $count, onEditingChanged: { changed in
//                print("onEditing: \(changed)")
//            }) {
//                print("userName: \(self.$count)")
//            }
//            .padding(10)
//            .frame(height: 50)
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
//        }
    }

}

//struct EditCountentView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditCountentView(
//            store:Store(initialState: Counter(), reducer: counterReducer, environment: counterEnvironmet())
//        )
//    }
//}
