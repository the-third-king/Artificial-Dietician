//
//  WeightEntryHost.swift
//  Artificial-Dietician
//
//  Host the view for weight entry page
//  Created by Cameron Triplett on 4/27/21.
//

import SwiftUI

struct WeightEntryHost: View {
    
    @State private var weight: String  = ""
    
    var body: some View {
        VStack{
            PageLabelView(pageTitle: "Weight")
            
            UserEnteryView(text: "New Weight:",
                           textFieldText: "Weight",
                           enteredValue: $weight,
                           numPad: true)
            Button{
                //TODO: put the wieght into the database
                print("weight entered")
                printThings()
            }label: {
                Text("Confirm Weight")
            }
        }
        Divider().frame(height: 5).background(Color("Mint"))
        
        ScrollView{
            Text("Previous Weights")
                .font(Font.system(size: 30))
            BorderedTextView(informativeText: "Day 1: ")
            
            BorderedTextView(informativeText: "Day 2: ")
            
            BorderedTextView(informativeText: "Day 3: ")
            
            BorderedTextView(informativeText: "Day 4: ")
            
            BorderedTextView(informativeText: "Day 5: ")
        }
    }
}

struct WeightEntryHost_Previews: PreviewProvider {
    static var previews: some View {
        WeightEntryHost()
    }
}
