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
    var password = ""
    var f_name = ""
    var l_name = ""
    var sex = ""
    var age = ""
    var height = ""
    var weight = ""
    var daysInARow = ""
    var prefersNotifications = true
    
    var dislikedFoods = ["", ""]
    
   
    static let `default` = Profile(username: "Username")
 
    
}
