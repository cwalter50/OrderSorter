//
//  Helpers&Modifiers.swift
//  OrderSorter
//
//  Created by Christopher Walter on 7/18/21.
//


import Foundation
import SwiftUI

struct BackgroundView: View {
    
    var background: String
    
    var body: some View {
        Image(background)
        .resizable()
        .edgesIgnoringSafeArea(.all)
    }
}

struct PrimaryButton: ViewModifier {
    private var color: Color
    
    init() {
        color = Color.darkGray
    }
    init(color: Color) {
        self.color = color
    }
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(color)
            .foregroundColor(Color.white)
            .font(.title)
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(color, lineWidth: 2))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(radius: 20)
    }
}

// if keyboard is on the screen during a transition, I was getting a wierd crash. this extension will hide the keyboard.
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
