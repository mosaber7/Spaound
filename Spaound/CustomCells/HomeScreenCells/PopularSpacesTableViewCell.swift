//
//  PopularSpacesTableViewCell.swift
//  Spaound
//
//  Created by Saber on 12/03/2021.
//

import UIKit
import Cosmos
import Kingfisher

class PopularSpacesTableViewCell: UITableViewCell {

    @IBOutlet weak var ratingStarsContainer: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var imageViewContainer: UIView!
    @IBOutlet weak var cellContainerView: UIView!
    @IBOutlet weak var discountImageView: UIImageView!
    @IBOutlet weak var beforeDiscountPriceLabel: UILabel!
    @IBOutlet weak var spaceImageView: UIImageView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    var space: Space!
    
    @IBOutlet weak var ratingView: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imageViewContainer.layer.cornerRadius = 8
        cellContainerView.layer.cornerRadius = 8
        cellContainerView.layer.borderWidth = 1
        cellContainerView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0))

    }
    
    
    func Config(){
        
        nameLabel.text = space.name
        adressLabel.text = space.address
        priceLabel.text = String(space.price)
        ratingView.rating = space.rating
        
        spinner.isHidden = false
        spinner.startAnimating()
        
        if let imageURL = URL(string: space.imageUrl)
        {
            spaceImageView.kf.setImage(with: imageURL)
            spinner.isHidden = true
            spinner.stopAnimating()
            
        }
        
        if let originalPrice = space.beforeDiscountPrice{
            beforeDiscountPriceLabel.text = String(originalPrice)
        }else{
            discountImageView.isHidden = true
            beforeDiscountPriceLabel.text = ""
        }
        
    }
    
    
    
}
