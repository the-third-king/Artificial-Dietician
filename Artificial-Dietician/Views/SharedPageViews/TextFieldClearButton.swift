//
//  TextFieldClearButton.swift
//  Artificial-Dietician
//
//  This shows a clear button when the text field is clicked on
//  Created by Cameron Triplett on 4/21/21.
//

import SwiftUI

struct TextFieldClearButton: ViewModifier{
    
    @Binding var text: String //User entered string
    
    func body(content: Content) -> some View{
        
        HStack{
            content
            //If text field is not empty show button and when clicked on clear the text field
            if !text.isEmpty{
                Button{
                    self.text = ""
                }label:{
                    Image(systemName: "delete.left")
                        .foregroundColor(Color(UIColor.opaqueSeparator))
                }
            }
        }
    }
}
