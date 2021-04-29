//
//  WeightEntryHost.swift
//  Artificial-Dietician
//
//  Host the view for weight entry page
//  Created by Cameron Triplett on 4/27/21.
//

import SwiftUI

struct WeightEntryHost: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var weight: String  = ""
    
    var body: some View {
        VStack{
            PageLabelView(pageTitle: "Weight")
            
            UserEnteryView(text: "New Weight:",
                           textFieldText: "Weight",
                           enteredValue: $weight,
                           numPad: true)
            Button{
                //update the profile
                modelData.profile.weight = weight
                for i in 0..<(modelData.profile.previousWeights.count-1){
                    modelData.profile.previousWeights[i + 1] = modelData.profile.previousWeights[i]
                }
                modelData.profile.previousWeights[0] = weight
                //Dismiss the keyboard
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                weight = ""
            }label: {
                Text("Confirm Weight")
            }
        }
        Divider().frame(height: 5).background(Color("Mint"))
        
        PreviousWeights()
            .environmentObject(ModelData())
    }
}

struct WeightEntryHost_Previews: PreviewProvider {
    static var previews: some View {
        WeightEntryHost()
            .environmentObject(ModelData())
    }
}
