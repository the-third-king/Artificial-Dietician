//
//  HomeHost.swift
//  Artificial-Dietician
//
//  This view will host the home page
//  Created by Cameron Triplett on 4/28/21.
//

import SwiftUI

struct HomeHost: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack{
            PageLabelView(pageTitle: "Home")
            
            BorderedTextView(informativeText: "Calories Eaten Today:")
            
            BorderedTextView(informativeText: "Amount of Protien: ")
            
            BorderedTextView(informativeText: "Amount of Carbohydrates: ")
            
            BorderedTextView(informativeText: "Today's Weight: \(modelData.profile.weight) lbs")
            
            Spacer()
        }
    }
}

struct HomeHost_Previews: PreviewProvider {
    static var previews: some View {
        HomeHost()
            .environmentObject(ModelData())
    }
}
