//
//  MealsList.swift
//  Artificial-Dietician
//
//  This file will show the list of foods eaten so far
//  Created by Cameron Triplett on 5/2/21.
//

import SwiftUI

struct MealsList: View {
    
    @EnvironmentObject var modelData: ModelData  //For the users food so far
    @Binding var mealType: [String] //Meal array grab
    
    var body: some View {
        VStack {
            //For each meal print the name and macros
            ForEach(mealType, id: \.self) { meal in
                HStack{
                    Text(meal)
                        .padding()
                    Spacer()
                    ForEach(meals, id: \.self){ finding in
                        if finding.itemName == meal{
                            Text("\(finding.calories) cal")
                            Text("\(finding.protein) g")
                            Text("\(finding.carbohydrates) g")
                            Text("\(finding.fat) g")
                                .padding(.trailing)
                        }
                    }
                }
                .frame(width: 360, height: 50, alignment: .center)
                .border(Color("Mint"))
                .background(Color("OpacMint"))
            }
        }
    }
}

struct MealsList_Previews: PreviewProvider {
    static var previews: some View {
        
        let food: [String] = ["Egg", "Hamburger"]

        MealsList(mealType: .constant(food))
            .environmentObject(ModelData())
    }
}
