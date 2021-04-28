//
//  BottomBarHost.swift
//  Artificial-Dietician
//
//  This will host the bottom bar view
//  Created by Cameron Triplett on 4/27/21.
//

import SwiftUI

struct BottomBarHost: View {
    
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        GeometryReader { geometry in
            HStack{
                TabBarIconView(viewRouter: viewRouter,
                               assignedPage: .mealEntry,
                               padding: .top,
                               width: geometry.size.width/5,
                               height: geometry.size.height/29,
                               systemIconName: "leaf",
                               tabName: "Meals")
                TabBarIconView(viewRouter: viewRouter,
                               assignedPage: .weightEntry, padding: .top,
                               width: geometry.size.width/5,
                               height: geometry.size.height/29,
                               systemIconName: "gauge",
                               tabName: "Weight")
                TabBarIconView(viewRouter: viewRouter,
                               assignedPage: .home, padding: .top,
                               width: geometry.size.width/5,
                               height: geometry.size.height/29,
                               systemIconName: "house",
                               tabName: "Home")
                TabBarIconView(viewRouter: viewRouter,
                               assignedPage: .search, padding: .top,
                               width: geometry.size.width/5,
                               height: geometry.size.height/29,
                               systemIconName: "magnifyingglass",
                               tabName: "Search")
                TabBarIconView(viewRouter: viewRouter,
                               assignedPage: .account, padding: .top,
                               width: geometry.size.width/5,
                               height: geometry.size.height/29,
                               systemIconName: "person.crop.circle",
                               tabName: "Account")
            }
            .frame(width: geometry.size.width, height: geometry.size.height/8)
            .background(LinearGradient(gradient: Gradient(colors: [Color("Mint"), .white]),
                                       startPoint: .top,
                                       endPoint: .bottom))
            .shadow(radius: 2)
        }
    }
}

struct BottomBarHost_Previews: PreviewProvider {
    static var previews: some View {
        BottomBarHost(viewRouter: ViewRouter())
    }
}
