//  Cameron Triplett
//  ContentView.swift
//  Artificial-Dietician
//
//  Created by Cameron Triplett on 4/12/21.
//

import SwiftUI

struct ContentView: View {
    
    //For moving between pages
    @StateObject var viewRouter: ViewRouter
    //For creating instances of profile and meal
    @EnvironmentObject var modelData: ModelData
    
    
    
    var body: some View {
        //reads the size of the screen
        GeometryReader { geometry in
            VStack{
                //Notifs/Title/logout
                TopBarHost(viewRouter: viewRouter)
                    .frame(width: geometry.size.width,
                           height: 75)
                                .background(LinearGradient(gradient: Gradient(colors: [.white, Color("Mint")]),
                                                           startPoint: .top,
                                                           endPoint: .bottom))
                                .shadow(radius: 2)
                                .ignoresSafeArea(.keyboard, edges: .bottom)
                Spacer()
                //For each page if clicked
                switch viewRouter.currentPage{
                case.home:
                    HomeHost()
                        .environmentObject(modelData)
                case.mealEntry:
                    MealEntryHost(viewRouter: viewRouter)
                        .environmentObject(modelData)
                case.weightEntry:
                    WeightEntryHost()
                        .environmentObject(modelData)
                    Spacer()
                case.account:
                    ProfileHost()
                        .environmentObject(modelData)
                case.notification:
                    NotificationList()
                        .environmentObject(modelData)
                case.logOut:
                    Text("Log Out of Account")
                }
                
                Spacer()
                
                //Bottom navigation bar to change pages if clicked on
                HStack{
                    Spacer()
                    TabBarIconView(viewRouter: viewRouter,
                                   assignedPage: .home, padding: .top,
                                   width: geometry.size.width/5,
                                   height: geometry.size.height/29,
                                   systemIconName: "house",
                                   tabName: "Home")
                    Spacer()
                    TabBarIconView(viewRouter: viewRouter,
                                   assignedPage: .mealEntry,
                                   padding: .top,
                                   width: geometry.size.width/5,
                                   height: geometry.size.height/29,
                                   systemIconName: "leaf",
                                   tabName: "Meals")
                    Spacer()
                    TabBarIconView(viewRouter: viewRouter,
                                   assignedPage: .weightEntry, padding: .top,
                                   width: geometry.size.width/5,
                                   height: geometry.size.height/29,
                                   systemIconName: "gauge",
                                   tabName: "Weight")
                    Spacer()
                    TabBarIconView(viewRouter: viewRouter,
                                   assignedPage: .account, padding: .top,
                                   width: geometry.size.width/5,
                                   height: geometry.size.height/29,
                                   systemIconName: "person.crop.circle",
                                   tabName: "Account")
                    Spacer()
                }
                .frame(width: geometry.size.width, height: geometry.size.height/8)
                .background(LinearGradient(gradient: Gradient(colors: [Color("Mint"), .white]),
                                           startPoint: .top,
                                           endPoint: .bottom))
                .shadow(radius: 2)
 
                
            }
            .edgesIgnoringSafeArea(.vertical)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(viewRouter: ViewRouter())
                .environmentObject(ModelData())
        }
    }
}

