//
//  UIImageView+.swift
//  RainDrop
//
//  Created by 성다연 on 2021/07/20.
//

import UIKit

extension UIImageView {
    open class func createRainDrop(indexPathRow at : Int) -> UIImageView {
        let iv = UIImageView(frame: .zero)
        iv.backgroundColor = .custom_purple
        iv.clipsToBounds = true
        iv.tag = at
        iv.layer.cornerRadius = 4
        return iv
    }
    
    func attachShadowEffects() {
        clipsToBounds = true
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 5, height: 5)
    }
}
