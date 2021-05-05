//
//  TabBarIconView.swift
//  Artificial-Dietician
//
//  The button on the bottom bar
//  Created by Cameron Triplett on 4/21/21.
//

import SwiftUI

struct TabBarIconView: View {
    
    @StateObject var viewRouter: ViewRouter //To change the page
    let assignedPage: Page //The assigned page title
    let padding: Edge.Set //The edge for padding
    
    let width, height: CGFloat //The width and height of the frame to be entered
    let systemIconName, tabName: String //The name of the icon to use and page description for below icon
    
    var body: some View {
        VStack{
            //Create the button
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(padding, 10)
            //Add the page title to bottom
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
        .padding(.horizontal, -4)
        .onTapGesture{
            viewRouter.currentPage = assignedPage
        }
        //Highlight the icon of the page we are currently on
        .foregroundColor(viewRouter.currentPage == assignedPage ? Color("TabBarHighlight") : .gray)
    }
}

struct TabBarIconView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarIconView(viewRouter: ViewRouter(), assignedPage: .home, padding: .all, width: 10, height: 10,
                       systemIconName: "house", tabName: "Home")
    }
}
