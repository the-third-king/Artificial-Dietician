//
//  TabBarIconView.swift
//  Artificial-Dietician
//
//  The button on the bottom bar
//  Created by Cameron Triplett on 4/21/21.
//

import SwiftUI

struct TabBarIconView: View {
    
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    let padding: Edge.Set
    
    let width, height: CGFloat
    let systemIconName, tabName: String
    
    var body: some View {
        VStack{
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(padding, 10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
        .padding(.horizontal, -4)
        .onTapGesture{
            viewRouter.currentPage = assignedPage
        }
        .foregroundColor(viewRouter.currentPage == assignedPage ? Color("TabBarHighlight") : .gray)
    }
}

struct TabBarIconView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarIconView(viewRouter: ViewRouter(), assignedPage: .home, padding: .all, width: 10, height: 10, systemIconName: "house", tabName: "Home")
    }
}
