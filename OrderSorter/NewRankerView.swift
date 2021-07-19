//
//  NewRankerView.swift
//  OrderSorter
//
//  Created by Christopher Walter on 7/17/21.
//

import SwiftUI

struct NewRankerView: View {
    
//    @State var words: [Item]
    @State var items: [Item] = [Item(name: "Apple", value: 0), Item(name: "Banana", value: 0), Item(name: "Strawberry", value: 0)]
    
    @State var editMode: EditMode = .active
    
    
    var body: some View {
        VStack(alignment: .center) {
            GroupBox(label: Text("Title")) {
                Text("Body")
            }
            List {
                ForEach(items.indices, id: \.self) {
                    i in
                    Text("\(i) \(self.items[i].name)")
                }
                .onMove { indices, newOffset in
                    self.items.move(fromOffsets: indices, toOffset: newOffset)
                }
                
                
            }
            .environment(\.editMode, $editMode)


          
            ColorPicker("Select Color", selection: /*@START_MENU_TOKEN@*/.constant(.red)/*@END_MENU_TOKEN@*/)
            Text("Hello, world!")
                .padding()
        }
        .padding(.horizontal)
        .frame(height: nil)
        
    }
    
    func move(from source: IndexSet, to destination: Int) {
            items.move(fromOffsets: source, toOffset: destination)
    }
}

struct NewRankerView_Previews: PreviewProvider {
    static var previews: some View {
        NewRankerView()
    }
}
