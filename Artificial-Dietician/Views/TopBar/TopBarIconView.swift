//
//  TopBarIconView.swift
//  Artificial-Dietician
//
//  The button on the top bar
//  Created by Cameron Triplett on 4/21/21.
//

import SwiftUI

struct TopBarIconView: View {
    
    //For changing pages
    @StateObject var viewRouter: ViewRouter
    //Assigned page title
    let assignedPage: Page
    //change padding allignment
    let edge: Edge.Set
    //Get the system icon to use
    let systemIconName: String
    
    var body: some View {
        //Create the tappable Icon
        Image(systemName: systemIconName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 16, height: 16)
            .padding(.top, 40)
            .padding(edge, 10)
            .onTapGesture{
                viewRouter.currentPage = assignedPage
            }
    }
    
}

struct TopBarIconView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarIconView(viewRouter: ViewRouter(), assignedPage: .home, edge: .top, systemIconName: "")
    }
}
