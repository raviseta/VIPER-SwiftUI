//
//  AppColor.swift
//  RecipeApp
//
//  Created by Ravi Seta on 26/01/25.
//

import UIKit

public enum AppColor {
    case gray30

}

public extension UIColor {
    static func getAppColor(_ type : AppColor) -> UIColor {
        switch type {
        case .gray30:
            return UIColor.init(dynamicProvider: { trait in
                return trait.userInterfaceStyle == .light ? UIColor(hexString: "#FAFAFA") : UIColor(hexString: "#313131")
            })
        }
    }
}
