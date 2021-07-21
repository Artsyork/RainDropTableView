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
    @IBOutlet weak var rainImageView: UIImageView! {
        didSet {
            rainImageView.clipsToBounds = true
            rainImageView.layer.cornerRadius = 4
        }
    }
    @IBOutlet weak var verticalLineView: UIView!
    
    static let cellID = "RainDropTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setRainDropEffects(index addTime : Int) {
        UIView.animate(withDuration: 1.4, delay: (Double(addTime) * 0.14) + 0.8, animations:  { [weak self] in
            self?.rainImageView.frame.origin.x += 30
        }, completion: { _ in
            self.rainImageView.isHidden = true
            self.completeImageView.isHidden = false
        })
    }
}
