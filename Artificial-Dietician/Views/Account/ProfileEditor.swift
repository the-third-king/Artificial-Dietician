//
//  ProfileEditor.swift
//  Artificial-Dietician
//
//  Allows editing of the profile
//  Created by Cameron Triplett on 4/26/21.
//

import SwiftUI

struct ProfileEditor: View {
    
    @Binding var profile: Profile
    
    var body: some View {
        GeometryReader {geometry in
            List{
                Toggle(isOn: $profile.prefersNotifications){
                                Text("Enable Notifications").bold()
                            }
                ProfileEditingBar(text: "Username",
                                  textFieldText: "Username",
                                  enteredValue: $profile.username)
                ProfileEditingBar(text: "Password",
                                  textFieldText: "Password",
                                  enteredValue: $profile.password)
                ProfileEditingBar(text: "First Name",
                                  textFieldText: "First Name",
                                  enteredValue: $profile.f_name)
                ProfileEditingBar(text: "Last Name",
                                  textFieldText: "Last Name",
                                  enteredValue: $profile.l_name)
                ProfileEditingBar(text: "Sex",
                                  textFieldText: "Sex",
                                  enteredValue: $profile.sex)
                ProfileEditingBar(text: "Age",
                                  textFieldText: "Age",
                                  enteredValue: $profile.age)
                ProfileEditingBar(text: "Height",
                                  textFieldText: "Height",
                                  enteredValue: $profile.height)
                
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(profiles[0]))
    }
}
