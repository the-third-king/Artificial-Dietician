//
//  MealType.swift
//  Artificial-Dietician
//
//  This file is for the container of the mealtype
//  Created by Cameron Triplett on 4/30/21.
//

import SwiftUI

struct MealType: View {
    
    var mealName: String  //Breakfast/lunch/dinner
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color("Mint"))
                .frame(width: 365, height: 75)
            HStack{
                Text(mealName)
                    .font(.system(size: 20, weight: .bold))
                    .padding()
                Spacer()
                Image(systemName: "plus")
                    .font(.system(size: 40))
                    .foregroundColor(.blue)
                    .padding()
            }
            .frame(width: 365, height: 75)
        }
    }
}

struct MealType_Previews: PreviewProvider {
    static var previews: some View {
        MealType(mealName: "Meal")
    }
}
