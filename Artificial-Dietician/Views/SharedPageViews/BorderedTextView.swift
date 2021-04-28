//
//  BorderedTextView.swift
//  Artificial-Dietician
//
//  View for the bordered text fields
//  Created by Cameron Triplett on 4/21/21.
//

import SwiftUI

struct BorderedTextView: View {
    
    let informativeText: String
    
    var body: some View {
        HStack{
            Text(informativeText)
                .padding()
        }
        .frame(width: 350,
               height: 70,
               alignment: .leading)
        .background(LinearGradient(gradient: Gradient(colors: [.gray, Color("Mint")]),
                                   startPoint: .leading,
                                   endPoint: .trailing))
        .cornerRadius(50)
    }

}

struct BorderedTextView_Previews: PreviewProvider {
    static var previews: some View {
        BorderedTextView(informativeText: "")
    }
}
