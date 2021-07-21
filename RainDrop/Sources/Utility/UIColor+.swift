//
//  RainDrop.swift
//  RainDrop
//
//  Created by 성다연 on 2021/07/21.
//

import UIKit

extension UIColor {
    class func colorRGBHex(hex:Int, alpha: Float = 1.0) -> UIColor {
        let r = Float((hex >> 16) & 0xFF)
        let g = Float((hex >> 8) & 0xFF)
        let b = Float((hex) & 0xFF)
        return UIColor(red: CGFloat(r/255.0), green: CGFloat(g/255.0), blue:CGFloat(b/255.0), alpha : CGFloat(alpha))
    }
    
    class var custom_purple : UIColor { return .colorRGBHex(hex: 0x531B93) }
}
