//
//  HomeHost.swift
//  Artificial-Dietician
//
//  This view will host the home page
//  Created by Cameron Triplett on 4/28/21.
//

import SwiftUI

struct HomeHost: View {
    
    @EnvironmentObject var modelData: ModelData  //To get the info of the profile instance
    
    var body: some View {
        //print viewable object with the user information for cal, prot, carb, fat, and weight
        VStack{
            PageLabelView(pageTitle: "Home")
            
            BorderedTextView(informativeText: "Calories Eaten Today: \(Int(FindCalories(modelData: modelData)) - Int(CaloriesLeft(modelData: modelData))) KCal")
            
            BorderedTextView(informativeText: "Amount of Protien: \(DailyProtein(modelData: modelData)) g")
            
            BorderedTextView(informativeText: "Amount of Carbohydrates: \(DailyCarbohydrates(modelData: modelData)) g")
            
            BorderedTextView(informativeText: "Amount of Fats: \(DailyFats(modelData: modelData)) g")
            
            BorderedTextView(informativeText: "Today's Weight: \(modelData.profile.weight) lbs")
            
            Spacer()
        }
    }
}

struct HomeHost_Previews: PreviewProvider {
    static var previews: some View {
        HomeHost()
            .environmentObject(ModelData())
    }
}
