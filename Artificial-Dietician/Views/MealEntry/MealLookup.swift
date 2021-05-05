//
//  MealLookup.swift
//  Artificial-Dietician
//
//  This file uses the search bar to find the meals
//  Created by Cameron Triplett on 4/30/21.
//

import SwiftUI

struct MealLookup: View {
    
    @State private var searchText = "" //user entered text
    @StateObject var viewRouter: ViewRouter //change the page
    @EnvironmentObject var modelData: ModelData //The meals instance
    @Binding var appendingArray: [String] //The array to add the meal to (breakfast/lunch/dinner)
    
    var body: some View {
        VStack{
            SearchBar(text: $searchText)
                .padding(.top, 4)
            //filter meals based on what the user searches for
            let filteredMeals = meals.filter { meal in
                return meal.itemName.contains(searchText)
                
            }
            //Send out how many matching results
            Text(String(filteredMeals.count) + " results")
            //Give a list of matching food
            List(filteredMeals, id: \.itemName) { meal in
                //Send them to the food detail page if clicked on
                NavigationLink(destination: MealDetail(meal: meal, viewRouter: viewRouter, appendingArray: $appendingArray).environmentObject(ModelData())){
                    SearchResult(meal: meal)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Meal Search")
        .padding(.trailing)
        .padding([.top, .bottom], 20)
    }
}

struct MealLookup_Previews: PreviewProvider {
    static var previews: some View {
        let appendingArray = ["Apple"]
        
        MealLookup(viewRouter: ViewRouter(), appendingArray: .constant(appendingArray))
            .environmentObject(ModelData())
    }
}
