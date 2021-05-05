//
//  ProfileHost.swift
//  Artificial-Dietician
//
//  Will be a host for a view of the profile and editor of the profile
//  Created by Cameron Triplett on 4/27/21.
//

import SwiftUI

struct ProfileHost: View {
    
    @Environment(\.editMode) var editMode  //For the edit mode of the user profile
    @EnvironmentObject var modelData: ModelData  //instance of the user
    @State private var draftProfile = Profile.default  //default profile for editing purposes
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            HStack{
                //Cancel mode while editing
                if editMode?.wrappedValue == .active {
                    Button("Cancel"){
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            
            //If editing is inactive show profile else show the edited profile
            if editMode?.wrappedValue == .inactive{
                ProfileSummary()
            }else{
                ProfileEditor(profile: $draftProfile)
                    .onAppear{
                        draftProfile = modelData.profile
                    }
                    .onDisappear{
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
