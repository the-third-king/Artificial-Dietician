//
//  PageLabelView.swift
//  Artificial-Dietician
//
//  Created by user192665 on 4/21/21.
//

import SwiftUI

struct PageLabelView: View {
    
    var pageTitle: String
    
    var body: some View {
        
        
            Text(pageTitle)
                .bold()
                .font(Font.system(size: 35))
                .padding(8)
                .overlay(RoundedRectangle(cornerRadius: 30)
                            .stroke(Color("Mint"), lineWidth: 5))
        
    }
}

struct PageLabelView_Previews: PreviewProvider {
    static var previews: some View {
        PageLabelView(pageTitle: "")
    }
}
