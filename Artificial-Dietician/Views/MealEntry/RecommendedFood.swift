//
//  RecommendedFood.swift
//  Artificial-Dietician
//
//  This page is the list of foods the user will like
//  Created by Cameron Triplett on 5/3/21.
//

import SwiftUI

struct RecommendedFood: View {
    
    @EnvironmentObject var modelData: ModelData //This is the profile instance to get the disliked meals
    
    var body: some View {
        //Find the recommended meals and put them into a meal array
        let recommendedFood: [Meal] = findRecommendedMeal(modelData: modelData)
        List(recommendedFood, id: \.self) { meal in
            HStack{
                Text(meal.itemName)
                Spacer()
                Text("\(meal.calories) KCal")
            }
            .navigationTitle("Recommended Foods")
        }
    }
}

//Function finds the liked foods and stores them into an array
func findRecommendedMeal(modelData: ModelData) -> [Meal] {
    var recommendedFood: [Meal] = []
    for i in 0..<meals.count{
        for j in 0..<modelData.profile.dislikedFoods.count{
            if meals[i].itemName.contains(modelData.profile.dislikedFoods[j]){
                break
            }
            else{
                recommendedFood.append(meals[i])
                break
            }
        }
    }
    
    return recommendedFood
}

struct RecommendedFood_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedFood()
            .environmentObject(ModelData())
    }
}
