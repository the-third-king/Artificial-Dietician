//
//  Profile.swift
//  Artificial-Dietician
//
//  Gets the values for the profile
//  Created by Cameron Triplett on 4/26/21.
//

import Foundation
import SwiftUI


struct Profile: Hashable, Codable{
    
    var username: String
    var password = "testPass"
    var f_name = "Test"
    var l_name = "User"
    var sex = "M"
    var age = "20"
    var height = "72"
    var weight = "213"
    var daysInARow = "10"
    var prefersNotifications = true
    
    var dislikedFoods = ["Chicken", "Broccoli"]
    
   
    static let `default` = Profile(username: "Username")
 
    
}
