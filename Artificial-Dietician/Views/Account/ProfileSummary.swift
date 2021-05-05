//
//  ProfileSummary.swift
//  Artificial-Dietician
//
//  summary takes a Profile value and displays the basic user information
//  Created by Cameron Triplett on 4/27/21.
//

import SwiftUI

struct ProfileSummary: View {
    
    @EnvironmentObject var modelData: ModelData  //For the profile instance
    //var profile: Profile
    
    var body: some View {
        //Show profile info
        ScrollView{
            VStack(alignment: .leading, spacing: 10){
                Text("\(modelData.profile.f_name) \(modelData.profile.l_name)")
                    .bold()
                    .font(.title)
                
                Text("Notifications: \(modelData.profile.prefersNotifications ? "On": "Off" )")
                Text("Username: \(modelData.profile.username)")
                Text("Password: ********")
                Text("Sex: \(modelData.profile.sex)")
                Text("Age (Years): \(modelData.profile.age)")
                Text("Height (Inches): \(modelData.profile.height)")
                Text("Weight (lbs): \(modelData.profile.weight)")
                Text("Goal Weight (lbs): \(modelData.profile.goalWeight)")
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary()
            .environmentObject(ModelData())
    }
}
