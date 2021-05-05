//
//  SearchResult.swift
//  Artificial-Dietician
//
//  This page creates the preview for the list of the food
//  Created by Cameron Triplett on 4/29/21.
//

import SwiftUI

struct SearchResult: View {
    
    var meal: Meal //This is the meal for the meal information
    
    var body: some View {
        HStack{
            HStack{
                Text(meal.itemName)
                    .bold()
                    .padding()
                Spacer()
                VStack{
                    Text("Cals")
                    Text(String(meal.calories) + " cals")
                }
                .padding(.trailing, 4)
            }
        }
    }
}

struct SearchResult_Previews: PreviewProvider {
    static var previews: some View {
        SearchResult(meal: meals[0])
    }
}
