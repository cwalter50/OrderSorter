//
//  ContentView.swift
//  OrderSorter
//
//  Created by Christopher Walter on 7/17/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var roomCode: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView(background: "background7")
                VStack {
                    Button(action: {
                        self.hideKeyboard()
                    }, label: {
                        Text("New Game")
                            .modifier(PrimaryButton())
                    })
                    TextField("Enter Room Code", text: $roomCode)
                        .font(.title)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(10)
                        .multilineTextAlignment(.center)
                        .autocapitalization(.allCharacters)
                        .disableAutocorrection(true)
                    Button(action: {
                        self.hideKeyboard()
//                        self.joinRoom()
                    }){
                        Text("Join Game")
                            .modifier(PrimaryButton())
                    }
                    Spacer()
                }
                .padding([.horizontal], 20)
            }
            .navigationBarTitle("OrderSorter")
        }
    }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        

        ContentView()
    }
}




