//
//  EditCountentView.swift
//  TCACounterApp
//
//  Created by nigelli on 2022/7/28.
//

import SwiftUI
import ComposableArchitecture


struct EditCountentView: View {
    @State var count = ""
    var body: some View {
        TextField("", text: $count, onEditingChanged: { changed in
            print("onEditing: \(changed)")
        }) {
            print("userName: \(self.$count)")
//            self.endEditing(true)
        }
        .padding(10)
        .frame(height: 50)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }

}

//struct EditCountentView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditCountentView(
//            store: Store<Counter.Type, CounterAction>
//    }
//}
