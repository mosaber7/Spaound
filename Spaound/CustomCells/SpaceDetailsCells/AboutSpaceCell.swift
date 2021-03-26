//
//  AboutSpaceCell.swift
//  Spaound
//
//  Created by Saber on 23/03/2021.
//

import UIKit

class AboutSpaceCell: UITableViewCell {
    @IBOutlet weak var aboutLabel: UILabel!
    
    var space: Space!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    //    aboutLabel.text = space.about
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    func config(){
        aboutLabel.text = space.about
    }
}
