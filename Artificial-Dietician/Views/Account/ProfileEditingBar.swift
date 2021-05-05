//
//  ProfileEditingBar.swift
//  Artificial-Dietician
//
//  View for the bar that holds the user information while editing
//  Created by Cameron Triplett on 4/27/21.
//

import SwiftUI

struct ProfileEditingBar: View {
    
    let text: String //User attribute
    let textFieldText: String //user attribute to show text field
    @Binding var enteredValue: String //user entered field
    let numberPad: Bool  //is the attribute number only
    
    var body: some View {
        HStack(){
            //attibute is number only else attribute has full keyboard
            if numberPad{
                Text(text).bold()
                Divider().ignoresSafeArea()
                TextField(textFieldText, text: $enteredValue)
                    .keyboardType(.numberPad)
            }else{
                Text(text).bold()
                Divider().ignoresSafeArea()
                TextField(textFieldText, text: $enteredValue)
            }
        }
    }
}

struct ProfileEditingBar_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditingBar(text: "Sample", textFieldText: "Sample", enteredValue: .constant("Sample"), numberPad: true)
    }
}
