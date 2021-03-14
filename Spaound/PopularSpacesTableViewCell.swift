//
//  PopularSpacesTableViewCell.swift
//  Spaound
//
//  Created by Saber on 12/03/2021.
//

import UIKit
import Cosmos

class PopularSpacesTableViewCell: UITableViewCell {

    @IBOutlet weak var ratingStarsContainer: UIView!
    
    @IBOutlet weak var imageViewContainer: UIView!
    @IBOutlet weak var cellContainerView: UIView!
    @IBOutlet weak var discountImageView: UIImageView!
    @IBOutlet weak var beforeDiscountPriceLabel: UILabel!
    
    
    lazy var starsView: CosmosView = {
        let view = CosmosView()
        return view
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        ratingStarsContainer.addSubview(starsView)
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
    
}
