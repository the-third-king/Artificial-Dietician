//
//  UserEnteryView.swift
//  Artificial-Dietician
//
//  View for user entry text fields
//  Created by Cameron Triplett on 4/21/21.
//

import SwiftUI

struct UserEnteryView: View {
    
    let text: String  //Textfield label
    let textFieldText: String  //text field removeable label
    @Binding var enteredValue: String //user entered value
    let numPad: Bool  //is the value number only
    
    
    var body: some View {
        HStack{
            //if value is number only show number pad keyboard else show full keyboard
            if(numPad){
                Text(text)
                Spacer()
                TextField(textFieldText, text: $enteredValue)
                    .modifier(TextFieldClearButton(text: $enteredValue))
                    .frame(width: 175, height: 25, alignment: .trailing)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .padding(.trailing, 4)
            }else{
                Text(text)
                Spacer()
                TextField(textFieldText, text: $enteredValue)
                    .modifier(TextFieldClearButton(text: $enteredValue))
                    .frame(width: 175, height: 25, alignment: .trailing)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.trailing, 4)
            }
        }
    }
}

struct UserEnteryView_Previews: PreviewProvider {
    static var previews: some View {
        UserEnteryView(text: "Text", textFieldText: "Text", enteredValue: Binding.constant(""), numPad: false)
    }
}
