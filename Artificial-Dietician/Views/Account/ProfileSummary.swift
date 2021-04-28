//
//  ProfileSummary.swift
//  Artificial-Dietician
//
//  summary takes a Profile value and displays the basic user information
//  Created by Cameron Triplett on 4/27/21.
//

import SwiftUI

struct ProfileSummary: View {
    
    @EnvironmentObject var modelData: ModelData
    var profile: Profile
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 10){
                Text("\(profile.f_name) \(profile.l_name)")
                    .bold()
                    .font(.title)
                
                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                Text("Username: \(profile.username)")
                Text("Password: ********")
                Text("Sex: \(profile.sex)")
                Text("Age: \(profile.age)")
                Text("Height: \(profile.height)")
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
