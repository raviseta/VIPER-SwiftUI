//
//  Color+Extension.swift
//  RecipeApp
//
//  Created by Ravi Seta on 26/01/25.
//

import SwiftUI

public extension UIColor {
    var swiftUI: Color {
        return Color(self)
    }
}

public extension Color {
    static func getAppColor(_ type : AppColor) -> Color {
        return UIColor.getAppColor(type).swiftUI
    }
}

public extension UIColor {
    
    convenience init(hexString: String) {
        var hex = hexString.hasPrefix("#")
        ? String(hexString.dropFirst())
        : hexString
        guard hex.count == 3 || hex.count == 6
        else {
            self.init(white: 1.0, alpha: 0.0)
            return
        }
        if hex.count == 3 {
            for (index, char) in hex.enumerated() {
                hex.insert(char, at: hex.index(hex.startIndex, offsetBy: index * 2))
            }
        }
        
        guard let intCode = Int(hex, radix: 16) else {
            self.init(white: 1.0, alpha: 0.0)
            return
        }
        
        self.init(
            red:   CGFloat((intCode >> 16) & 0xFF) / 255.0,
            green: CGFloat((intCode >> 8) & 0xFF) / 255.0,
            blue:  CGFloat((intCode) & 0xFF) / 255.0, alpha: 1.0
        )
    }
    
}


