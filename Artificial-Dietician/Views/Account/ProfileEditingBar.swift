//
//  ProfileEditingBar.swift
//  Artificial-Dietician
//
//  View for the bar that holds the user information while editing
//  Created by Cameron Triplett on 4/27/21.
//

import SwiftUI

struct ProfileEditingBar: View {
    
    let text: String
    let textFieldText: String
    @Binding var enteredValue: String
    
    var body: some View {
        HStack(){
            Text(text).bold()
            Divider().ignoresSafeArea()
            TextField(textFieldText, text: $enteredValue)
        }
    }
}

struct ProfileEditingBar_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditingBar(text: "Sample", textFieldText: "Sample", enteredValue: .constant("Sample"))
    }
}
