//
//  RecomndedSpacesCollectionViewCell.swift
//  Spaound
//
//  Created by Saber on 11/03/2021.
//

import UIKit
import Kingfisher

class RecomndedSpacesCollectionViewCell: UICollectionViewCell {
    
    var space: Space!
    @IBOutlet weak var nameLAbel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var soundViewContainer: UIView!
    @IBOutlet weak var wifiViewContainer: UIView!
    @IBOutlet weak var ContainerView: UIView!
    @IBOutlet weak var spaceImageView: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        

    }
    override func layoutSubviews() {
        superview?.layoutSubviews()
        
        soundViewContainer.layer.cornerRadius = 16
        wifiViewContainer?.layer.cornerRadius = 16
        ContainerView.layer.cornerRadius = 16
        
        
    }
    
    func Config(){
        nameLAbel.text = space.name
        spinner.startAnimating()
        if let imageURL = URL(string: space.imageUrl){
        spaceImageView.kf.setImage(with: imageURL)
            spinner.isHidden = true
            spinner.stopAnimating()
            
        }
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
