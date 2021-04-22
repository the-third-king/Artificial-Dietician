//
//  UserEnteryView.swift
//  Artificial-Dietician
//
//  Created by user192665 on 4/21/21.
//

import SwiftUI

struct UserEnteryView: View {
    
    let text: String
    let textFieldText: String
    @Binding var enteredValue: String
    let numPad: Bool
    
    
    var body: some View {
        HStack{
            if(numPad){
                Text(text)
                Spacer()
                TextField(textFieldText, text: $enteredValue)
                    .modifier(TextFieldClearButton(text: $enteredValue))
                    .frame(width: 175, height: 25, alignment: .trailing)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
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
            //store carbs into database
        }
    }
}

struct UserEnteryView_Previews: PreviewProvider {
    static var previews: some View {
        UserEnteryView(text: "", textFieldText: "", enteredValue: Binding.constant(""), numPad: false)
    }
}
