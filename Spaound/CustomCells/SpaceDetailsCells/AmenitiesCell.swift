//
//  AmenitiesCell.swift
//  Spaound
//
//  Created by Saber on 23/03/2021.
//

import UIKit

class AmenitiesCell: UITableViewCell {
    var space: Space!
    
    @IBOutlet weak var freeWifiContiner: UIView!
    @IBOutlet weak var libraryBookContainer: UIView!
    @IBOutlet weak var gamesRoomContainer: UIView!
    
    @IBOutlet weak var coffeeContainer: UIView!
    @IBOutlet weak var meetingRoomContiner: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

    }
    func config() {
        if freeWifiContiner != nil, !space.amenities.freeWifi {
            freeWifiContiner.removeFromSuperview()
        }
        if libraryBookContainer != nil,!space.amenities.libraryBook {
            libraryBookContainer.removeFromSuperview()
        }
        if gamesRoomContainer != nil,!space.amenities.gamesRoom{
            gamesRoomContainer.removeFromSuperview()
        }
        if coffeeContainer != nil ,!space.amenities.Coffee{
            coffeeContainer.removeFromSuperview()
        }
        if meetingRoomContiner != nil, !space.amenities.meetingRoom{
            meetingRoomContiner.removeFromSuperview()
        }
        
    }
    
}
