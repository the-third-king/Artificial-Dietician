//
//  TopBarIconView.swift
//  Artificial-Dietician
//
//  The botton on the top bar
//  Created by Cameron Triplett on 4/21/21.
//

import SwiftUI

struct TopBarIconView: View {
    
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    let edge: Edge.Set
    
    let systemIconName: String
    
    var body: some View {
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
