//
//  TextFieldClearButton.swift
//  Artificial-Dietician
//
//  Created by user192665 on 4/21/21.
//

import SwiftUI

struct TextFieldClearButton: ViewModifier{
    
    @Binding var text: String
    
    func body(content: Content) -> some View{
        
        HStack{
            content
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
