//
//  WeightEntryHost.swift
//  Artificial-Dietician
//
//  Host the view for weight entry page
//  Created by Cameron Triplett on 4/27/21.
//

import SwiftUI

struct WeightEntryHost: View {
    
    @EnvironmentObject var modelData: ModelData  //for the user instance
    @State private var weight: String  = ""  //weight the user is entering
    //@State private var previousWeights: [String] = []
    
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
                    //var holder = modelData.profile.previousWeights
                    modelData.profile.previousWeights[modelData.profile.previousWeights.count-(i+1)] = modelData.profile.previousWeights[modelData.profile.previousWeights.count-(i+2)]
                }
                modelData.profile.previousWeights[0] = weight
                //Dismiss the keyboard
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                weight = ""
            }label: {
                Text("Confirm Weight")
            }
            Divider().frame(height: 5).background(Color("Mint"))
            
            //Previous five days weights
            ScrollView{
                Text("Previous Weights")
                    .font(Font.system(size: 30))
                BorderedTextView(informativeText: "Day 1: \(modelData.profile.previousWeights[0]) lbs")
                
                BorderedTextView(informativeText: "Day 2: \(modelData.profile.previousWeights[1]) lbs")
                
                BorderedTextView(informativeText: "Day 3: \(modelData.profile.previousWeights[2]) lbs")
                
                BorderedTextView(informativeText: "Day 4: \(modelData.profile.previousWeights[3]) lbs")
                
                BorderedTextView(informativeText: "Day 5: \(modelData.profile.previousWeights[4]) lbs")
            }
        }
    }
}

struct WeightEntryHost_Previews: PreviewProvider {
    static var previews: some View {
        WeightEntryHost()
            .environmentObject(ModelData())
    }
}
