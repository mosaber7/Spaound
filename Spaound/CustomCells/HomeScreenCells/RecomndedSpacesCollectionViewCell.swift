//
//  RecomndedSpacesCollectionViewCell.swift
//  Spaound
//
//  Created by Saber on 11/03/2021.
//

import UIKit

class RecomndedSpacesCollectionViewCell: UICollectionViewCell {
    
    var space: Space!
    @IBOutlet weak var nameLAbel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var soundViewContainer: UIView!
    @IBOutlet weak var wifiViewContainer: UIView!
    @IBOutlet weak var ContainerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        

    }
    override func layoutSubviews() {
        superview?.layoutSubviews()
        
        soundViewContainer.layer.cornerRadius = 16
        wifiViewContainer?.layer.cornerRadius = 16
        ContainerView.layer.cornerRadius = 16
        cellConfig()
        
        
    }
    
    func cellConfig(){
        nameLAbel.text = space.name
        if let discountedPrice =  space.beforeDiscountPrice {
            priceLabel.text = "L.E \(discountedPrice)"
        }else{
            priceLabel.text = "L.E \(space.price)"
        }
        
        if !space.wifi{
            wifiViewContainer.isHidden = true
        }
    }
    
}
