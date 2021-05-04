//
//  MealEntryHost.swift
//  Artificial-Dietician
//
//  This file will host the view for the meal entry page
//  Created by Cameron Triplett on 4/28/21.
//

import SwiftUI

struct MealEntryHost: View {
    
    @StateObject var viewRouter: ViewRouter
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView{
            VStack{
                PageLabelView(pageTitle: "Meal Entry")
                    .padding(.top, 4)
                ScrollView{
                    VStack{
                        Text("Amount of Calories allowed: \(Int(FindCalories(modelData: modelData))) KCal")
                        Text("Amount of Calories left: \(Int(CaloriesLeft(modelData: modelData))) KCal")
                        Text("Total Protein: \(DailyProtein(modelData: modelData)) g")
                        Text("Total Carbohydrates: \(DailyCarbohydrates(modelData: modelData)) g")
                        Text("Total Fats: \(DailyFats(modelData: modelData)) g")
                    }
                    
                    NavigationLink(destination: MealLookup(viewRouter: viewRouter, appendingArray: $modelData.profile.breakfast).environmentObject(modelData)){
                        MealType(mealName: "Breakfast")
                            .padding(.bottom)
                    }
                    MealsList(mealType: $modelData.profile.breakfast)
                        .environmentObject(modelData)
                        .offset(y: -24)
                    
                    NavigationLink(destination: MealLookup(viewRouter: viewRouter, appendingArray: $modelData.profile.lunch).environmentObject(modelData)){
                        MealType(mealName: "Lunch")
                            .padding(.bottom)
                    }
                    MealsList(mealType: $modelData.profile.lunch)
                        .environmentObject(modelData)
                        .offset(y: -24)
                    
                    NavigationLink(destination: MealLookup(viewRouter: viewRouter, appendingArray: $modelData.profile.dinner).environmentObject(modelData)){
                        MealType(mealName: "Dinner")
                            .padding(.bottom)
                    }
                    MealsList(mealType: $modelData.profile.dinner)
                        .environmentObject(modelData)
                        .offset(y: -24)
                    NavigationLink(destination: RecommendedFood().environmentObject(modelData)){
                        Text("Recommended Meals List")
                            .frame(width: 365, height: 75, alignment: .center)
                            .font(.system(size: 25))
                            .background(Color("OpacMint"))
                            .cornerRadius(20)
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}


struct MealEntryHost_Previews: PreviewProvider {
    static var previews: some View {
        MealEntryHost(viewRouter: ViewRouter())
            .environmentObject(ModelData())
    }
}
