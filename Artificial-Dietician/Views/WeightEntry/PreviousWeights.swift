//
//  PreviousWeights.swift
//  Artificial-Dietician
//
//  Created by user192665 on 4/29/21.
//

import SwiftUI

struct PreviousWeights: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        
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

struct PreviousWeights_Previews: PreviewProvider {
    static var previews: some View {
        PreviousWeights()
            .environmentObject(ModelData())
    }
}
