//
//  MealLookup.swift
//  Artificial-Dietician
//
//  Created by user192665 on 4/30/21.
//

import SwiftUI

struct MealLookup: View {
    
    @State private var searchText = ""
    @StateObject var viewRouter: ViewRouter
    @EnvironmentObject var modelData: ModelData
    @Binding var appendingArray: [String]
    
    var body: some View {
        VStack{
            SearchBar(text: $searchText)
                .padding(.top, 4)
            
            let filteredMeals = meals.filter { meal in
                return meal.itemName.contains(searchText)
                
            }
            Text(String(filteredMeals.count) + " results")
            List(filteredMeals, id: \.itemName) { meal in
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
