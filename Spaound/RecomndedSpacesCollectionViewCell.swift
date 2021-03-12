//
//  RecomndedSpacesCollectionViewCell.swift
//  Spaound
//
//  Created by Saber on 11/03/2021.
//

import UIKit

class RecomndedSpacesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLAbel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var soundViewContainer: UIView!
    @IBOutlet weak var wifiViewContainer: UIView!
    @IBOutlet weak var ContainerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews() {
        superview?.layoutSubviews()
        soundViewContainer.layer.cornerRadius = 16
        wifiViewContainer.layer.cornerRadius = 16
        ContainerView.layer.cornerRadius = 16
    }

}
