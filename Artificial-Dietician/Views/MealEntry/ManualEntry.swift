//
//  ManualEntry.swift
//  Artificial-Dietician
//
//  This page is for manual entry of food
//  Created by Cameron Triplett on 4/30/21.
//  Not implemented yet

import SwiftUI

struct ManualEntry: View {
    
    @State private var mealName: String = ""  // for the user to enter
    @State private var calories: String = ""  // for the user to enter
    @State private var protien: String = ""  //for the user to enter
    @State private var carbs: String = ""  //for the user to enter
    
    var body: some View {
        VStack{
            UserEnteryView(text: "Meal Name",
                           textFieldText: "Meal Name",
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
            //Button to enter all of the information
            Button{
                print("Information entered")
                
                
                //enter all information from variables
            }label:{
                Text("Enter information")
            }
        }
    }
}

struct ManualEntry_Previews: PreviewProvider {
    static var previews: some View {
        ManualEntry()
    }
}
