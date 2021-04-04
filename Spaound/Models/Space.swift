//
//  Space.swift
//  Spaound
//
//  Created by Saber on 12/03/2021.
//

import Foundation

/*
 {
       "name": "Kognitif Space",
       "address": "Nasr City, Makram Ebid",
       "rating" : "3",
       "beforeDiscountPrice": 140,
       "price": 120,
       "wifi": true,
       "amenities":{
         "freeWifi": true,
         "libraryBook": true,
         "gamesRoom": true,
         "Coffee": true,
         "meetingRoom": true
       }
       "about": "Coworking is an arrangement in which workers of different companies share an office space",
       "availabiltyTimes":{
         "saturday":"8:00 AM - 12:00 AM",
         "sunday":"8:00 AM - 12:00 AM",
         "monday":"8:00 AM - 12:00 AM",
         "tuesday":"8:00 AM - 12:00 AM",
         "wednseday":"8:00 AM - 12:00 AM",
         "thurseday":"8:00 AM - 12:00 AM",
         "friday":"8:00 AM - 12:00 AM",
       }
       
       "imageUrl": "https://www.uschamber.com/co/uploads/images/_w622h415/benefits-coworking-space.jpg",
     }

*/

struct Space: Codable {
    
    var name: String
    var address: String
    var beforeDiscountPrice: Int?
    var price: Int
    var wifi: Bool
    var about: String
    var rating: Double
    var amenities: Amenities
    var availabiltyTimes : AvailabiltyTimes
    
    var imageUrl: String
    
}


