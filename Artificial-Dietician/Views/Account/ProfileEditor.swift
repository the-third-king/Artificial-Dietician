//
//  ProfileEditor.swift
//  Artificial-Dietician
//
//  Allows editing of the profile
//  Created by Cameron Triplett on 4/26/21.
//

import SwiftUI

struct ProfileEditor: View {
    
    @Binding var profile: Profile //Create a profile
    
    var body: some View {
        //read size of screen
        GeometryReader {geometry in
            //Show editable profile attributes
            List{
                Toggle(isOn: $profile.prefersNotifications){
                                Text("Enable Notifications").bold()
                            }
                ProfileEditingBar(text: "Username",
                                  textFieldText: "Username",
                                  enteredValue: $profile.username,
                                  numberPad: false)
                ProfileEditingBar(text: "Password",
                                  textFieldText: "Password",
                                  enteredValue: $profile.password,
                                  numberPad: false)
                ProfileEditingBar(text: "First Name",
                                  textFieldText: "First Name",
                                  enteredValue: $profile.f_name, numberPad: false)
                ProfileEditingBar(text: "Last Name",
                                  textFieldText: "Last Name",
                                  enteredValue: $profile.l_name, numberPad: false)
                ProfileEditingBar(text: "Sex",
                                  textFieldText: "Sex",
                                  enteredValue: $profile.sex, numberPad: false)
                ProfileEditingBar(text: "Age",
                                  textFieldText: "Age",
                                  enteredValue: $profile.age, numberPad: true)
                ProfileEditingBar(text: "Height",
                                  textFieldText: "Height",
                                  enteredValue: $profile.height, numberPad: true)
                ProfileEditingBar(text: "Goal Weight",
                                  textFieldText: "Goal Weight",
                                  enteredValue: $profile.goalWeight, numberPad: true)
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(profiles[0]))
    }
}
