//
//  RainDropTableViewCell.swift
//  RainDrop
//
//  Created by 성다연 on 2021/07/20.
//

import UIKit

class RainDropTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var completeImageView: UIImageView! {
        didSet {
            completeImageView.isHidden = true
            completeImageView.attachShadowEffects()
        }
    }

    @IBOutlet weak var verticalLineView: UIView!
    
    static let cellID = "RainDropTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
