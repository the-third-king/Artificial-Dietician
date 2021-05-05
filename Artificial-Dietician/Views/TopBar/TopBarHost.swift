//
//  TopBar.swift
//  Artificial-Dietician
//
//  This will host the view of the top menu bar
//  Created by Cameron Triplett on 4/27/21.
//

import SwiftUI

struct TopBarHost: View {
    
    //To change pages
    @StateObject var viewRouter: ViewRouter
    //@EnvironmentObject var modelData: ModelData
    
    var body: some View {
        //read size of screen
        GeometryReader { geometry in
            HStack{
                //Notification Icon
                TopBarIconView(viewRouter: viewRouter,
                               assignedPage: .notification,
                               edge: .leading,
                               systemIconName: "bell")
                    //.overlay(NotificationNumber().environmentObject(modelData)
                                //.offset(x: -130, y: 40))
                Spacer()
                //Title
                Text("Artificial Dietician")
                    .bold()
                    .padding(.top, 40)
                    .font(Font.system(size: 25))
                Spacer()
                //Logout Icon
                TopBarIconView(viewRouter: viewRouter,
                               assignedPage: .logOut,
                               edge: .trailing,
                               systemIconName: "ellipsis")
            }
        }
    }
}

struct TopBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TopBarHost(viewRouter: ViewRouter())
                //.environmentObject(ModelData())
        }
    }
}
