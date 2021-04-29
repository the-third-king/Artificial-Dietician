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
    @State private var mealName: String = ""
    @State private var calories: String = ""
    @State private var protien: String = ""
    @State private var carbs: String = ""
    
    var body: some View {
        VStack{
            PageLabelView(pageTitle: "Meal Entry")
            
            UserEnteryView(text: "Meal Type",
                           textFieldText: "Meal Type",
                           enteredValue: $mealName,
                           numPad: false)
            
            UserEnteryView(text: "Amount of Calories",
                           textFieldText: "Calories",
                           enteredValue: $calories,
                           numPad: true)
            
            UserEnteryView(text: "Amount of Protien: ",
                           textFieldText: "Protien",
                           enteredValue: $protien,
                           numPad: true)
            
            UserEnteryView(text: "Amount of Carbohydrates: ",
                           textFieldText: "Carbohydrates",
                           enteredValue: $carbs,
                           numPad: true)
            
            Button{
                print("Information entered")
                
                
                //enter all information from variables
            }label:{
                Text("Enter information")
            }
        }
        
        Divider().frame(height: 5).background(Color("Mint"))
        VStack{
            Text("or")
                .padding(5)
            Button{
                
            }label:{
                Text("Search")
                    .foregroundColor(Color.black)
                    .font(Font.system(size: 30))
                    .padding()
                    .background(Color("Mint"))
            }
            .shadow(radius: 10)
            Spacer()
        }
    }
}


struct MealEntryHost_Previews: PreviewProvider {
    static var previews: some View {
        MealEntryHost(viewRouter: ViewRouter())
    }
}
