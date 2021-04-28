//
//  TopBar.swift
//  Artificial-Dietician
//
//  This will host the view of the top menu bar
//  Created by Cameron Triplett on 4/27/21.
//

import SwiftUI

struct TopBarHost: View {
    
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        GeometryReader { geometry in
            HStack{
                TopBarIconView(viewRouter: viewRouter,
                               assignedPage: .notification,
                               edge: .leading,
                               systemIconName: "bell")
                Spacer()
                Text("Artificial Dietician")
                    .bold()
                    .padding(.top, 40)
                    .font(Font.system(size: 25))
                Spacer()
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
        }
    }
}
