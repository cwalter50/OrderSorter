//
//  TestView.swift
//  OrderSorter
//
//  Created by Christopher Walter on 7/17/21.
//

import SwiftUI

struct TestView: View {
    @State private var fruits = ["Apple", "Banana", "Mango"]
    @State private var isEditable = false

    var body: some View {
        List {
            ForEach(fruits, id: \.self) { user in
                Text(user)
            }
            .onMove(perform: move)
            .onLongPressGesture {
                withAnimation {
                    self.isEditable = true
                }
            }
        }
        .environment(\.editMode, isEditable ? .constant(.active) : .constant(.inactive))
    }

    func move(from source: IndexSet, to destination: Int) {
        fruits.move(fromOffsets: source, toOffset: destination)
        withAnimation {
            isEditable = false
        }
    }
}
struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
