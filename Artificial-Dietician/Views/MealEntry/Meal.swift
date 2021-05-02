//
//  Meal.swift
//  Artificial-Dietician
//
//  Created by Cameron Triplett on 4/29/21.
//

import Foundation
import SwiftUI


struct Meal: Hashable, Codable{
    var itemName: String
    var calories: Int
    var fat: Int
    var carbohydrates: Int
    var protein: Int
    var servingSize: Int
    var servingSizeUnit: String
    var servings: Int
    
    static let `default` = Meal(itemName: "Item",
                                calories: 0,
                                fat: 0,
                                carbohydrates: 0,
                                protein: 0,
                                servingSize: 0,
                                servingSizeUnit: "unit",
                                servings: 0)
}
