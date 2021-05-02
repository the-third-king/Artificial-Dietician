//
//  ManualEntry.swift
//  Artificial-Dietician
//
//  Created by user192665 on 4/30/21.
//

import SwiftUI

struct ManualEntry: View {
    
    @State private var mealName: String = ""
    @State private var calories: String = ""
    @State private var protien: String = ""
    @State private var carbs: String = ""
    
    var body: some View {
        VStack{
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
    }
}

struct ManualEntry_Previews: PreviewProvider {
    static var previews: some View {
        ManualEntry()
    }
}
