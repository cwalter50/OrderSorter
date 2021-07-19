//
//  ColorExtensions.swift
//  OrderSorter
//
//  Created by Christopher Walter on 7/18/21.
//

import Foundation
import SwiftUI

extension Color {
    public static var myCustomColor: Color {
        return Color(UIColor(red: 219/255, green: 175/255, blue: 15/255, alpha: 1.0))
    }
}

extension Color{
    // see http://bootflat.github.io/documentation.html for colors
    
    public static let blueJeansLight: Color = Color(UIColor(red: 93/255, green: 156/255, blue: 236/255, alpha: 1.0))/* #5d9cec */
    
    public static let blueJeansDark = Color(UIColor(red: 74/255, green: 137/255, blue: 220/255, alpha: 1.0)) /* #4a89dc */
    static let aquaDark = Color(UIColor(red: 59/255, green: 175/255, blue: 218/255, alpha: 1.0)) /* #3bafda */
    static let aquaLight = Color(UIColor(red: 79/255, green: 193/255, blue: 233/255, alpha: 1.0)) /* #4fc1e9 */
    static let mintLight = Color(UIColor(red: 72/255, green: 207/255, blue: 173/255, alpha: 1.0)) /* #48cfad */
    static let mintDark = Color(UIColor(red: 55/255, green: 188/255, blue: 155/255, alpha: 1.0)) /* #37bc9b */
    static let grassLight = Color(UIColor(red: 160/255, green: 212/255, blue: 104/255, alpha: 1.0)) /* #a0d468 */
    static let grassDark = Color(UIColor(red: 140/255, green: 193/255, blue: 82/255, alpha: 1.0)) /* #8cc152 */
    static let sunFlowerLight = Color(UIColor(red: 255/255, green: 206/255, blue: 84/255, alpha: 1.0)) /* #ffce54 */
    static let sunFlowerDark = Color(UIColor(red: 246/255, green: 187/255, blue: 66/255, alpha: 1.0)) /* #f6bb42 */
    static let bitterSweetLight = Color(UIColor(red: 252/255, green: 110/255, blue: 81/255, alpha: 1.0)) /* #fc6e51 */
    static let bitterSweetDark = Color(UIColor(red: 233/255, green: 87/255, blue: 63/255, alpha: 1.0)) /* #e9573f */
    static let grapefruitLight = Color(UIColor(red: 237/255, green: 85/255, blue: 101/255, alpha: 1.0)) /* #ed5565 */
    static let grapefruitDark = Color(UIColor(red: 218/255, green: 68/255, blue: 83/255, alpha: 1.0)) /* #da4453 */
    static let lavendarLight = Color(UIColor(red: 172/255, green: 146/255, blue: 236/255, alpha: 1.0)) /* #ac92ec */
    static let lavendarDark = Color(UIColor(red: 150/255, green: 122/255, blue: 220/255, alpha: 1.0)) /* #967adc */
    static let pinkRoseLight = Color(UIColor(red: 236/255, green: 135/255, blue: 192/255, alpha: 1.0))
    static let pinkRoseDark = Color(UIColor(red: 215/255, green: 112/255, blue: 173/255, alpha: 1.0))
    static let oringalGreen = Color(UIColor(red: 104/255, green: 187/255, blue: 111/255, alpha: 1.0))
    static let originalRed = Color(UIColor(red: 255/255, green: 126/255, blue: 121/255, alpha: 1.0))
    static let lightGray = Color(UIColor(red: 230/255, green: 237/255, blue: 233/255, alpha: 1.0))
    static let mediumGray = Color(UIColor(red: 170/255, green: 178/255, blue: 189/255, alpha: 1.0))
    static let darkGray = Color(UIColor(red: 67/255, green: 74/255, blue: 84/255, alpha: 1.0))
    //
    //    LIGHT GRAY
    //    0xF5F7FA, 0xE6E9ED
    //
    //    MEDIUM GRAY
    //    0xCCD1D9, 0xAAB2BD
    //
    //    DARK GRAY
    //    0x656D78, 0x434A54
    
    func uiColor() -> UIColor {
        let components = self.components()
        return UIColor(red: components.r, green: components.g, blue: components.b, alpha: components.a)
    }
    private func components() -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
        let result = scanner.scanHexInt64(&hexNumber)
        if result {
            r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
            a = CGFloat(hexNumber & 0x000000ff) / 255
        }
    return (r, g, b, a)
    }
    
    
    
    // MARK: - Initialization
    
    // this might not work. I made some updates to it... for a quick bandaid to work in this app.
    init?(hex: String) {
        var hexNormalized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexNormalized = hexNormalized.replacingOccurrences(of: "#", with: "")
        
        // Helpers
        var rgb: UInt64 = 0
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0
        let length = hexNormalized.count
        
        // Create Scanner
        Scanner(string: hexNormalized).scanHexInt64(&rgb)
        
        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0
            
        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0
            
        } else {
            return nil
        }
        self.init(UIColor(red: r, green: g, blue: b, alpha: a))
    }
    
    // MARK: - Convenience Methods
    
    var toHex: String? {
        // Extract Components
        
        guard let components = uiColor().cgColor.components, components.count >= 3 else {
            return nil
        }
        
        // Helpers
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        var a = Float(1.0)
        
        if components.count >= 4 {
            a = Float(components[3])
        }
        
        // Create Hex String
        let hex = String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
        
        return hex
    }
}
