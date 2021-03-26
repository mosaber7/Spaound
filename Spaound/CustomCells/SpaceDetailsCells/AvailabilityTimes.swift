//
//  AdditionalPricesCell.swift
//  Spaound
//
//  Created by Saber on 23/03/2021.
//

import UIKit

class AvailabilityTimes: UITableViewCell {
    var space: Space!
    
    @IBOutlet weak var saturdayLabel: UILabel!
    @IBOutlet weak var sundayLabel: UILabel!
    @IBOutlet weak var mondayLabel: UILabel!
    @IBOutlet weak var tuesdayLabel: UILabel!
    @IBOutlet weak var wednsedayLabel: UILabel!
    @IBOutlet weak var thursedayLabel: UILabel!
    @IBOutlet weak var fridayLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
    
    func config(){
        saturdayLabel.text = space.availabiltyTimes.saturday
        sundayLabel.text = space.availabiltyTimes.sunday
        mondayLabel.text = space.availabiltyTimes.monday
        tuesdayLabel.text = space.availabiltyTimes.tuesday
        wednsedayLabel.text = space.availabiltyTimes.wednseday
        thursedayLabel.text = space.availabiltyTimes.thurseday
        fridayLabel.text = space.availabiltyTimes.friday
    }
    
}
