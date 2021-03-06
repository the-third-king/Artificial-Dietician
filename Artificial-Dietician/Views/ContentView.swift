//  Cameron Triplett
//  ContentView.swift
//  Artificial-Dietician
//
//  Created by Cameron Triplett on 4/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewRouter: ViewRouter
    @State private var mealName: String = ""
    @State private var calories: String = ""
    @State private var protien: String = ""
    @State private var carbs: String = ""
    //@State private var weight: String  = ""
    @EnvironmentObject var modelData: ModelData
    
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack{  
                TopBarHost(viewRouter: viewRouter)
                    .frame(width: geometry.size.width,
                                       height: 70)
                                .background(LinearGradient(gradient: Gradient(colors: [.white, Color("Mint")]),
                                                           startPoint: .top,
                                                           endPoint: .bottom))
                                .shadow(radius: 2)
                                .ignoresSafeArea(.keyboard, edges: .bottom)
                Spacer()
                switch viewRouter.currentPage{
                case.home:
                    VStack{
                        PageLabelView(pageTitle: "Home")
                        
                        BorderedTextView(informativeText: "Caloreies Eaten Today:")
                        
                        BorderedTextView(informativeText: "Amount of Protien: ")
                        
                        BorderedTextView(informativeText: "Amount of Carbohydrates: ")
                        
                        BorderedTextView(informativeText: "Today's Weight: ")
                        
                        Spacer()
                    }
                    
                case.mealEntry:
                    VStack{
                        PageLabelView(pageTitle: "Meal Entry")
                        
                        UserEnteryView(text: "Meal Type",
                                       textFieldText: "Meal Type",
                                       enteredValue: $mealName,
                                       numPad: false)
                        
                        UserEnteryView(text: "Amount of Calories",
                                       textFieldText: "Calories",
                                       enteredValue: $calories,
                                       numPad: true)
                        
                        UserEnteryView(text: "Amount of Protien: ",
                                       textFieldText: "Protien",
                                       enteredValue: $protien,
                                       numPad: true)
                        
                        UserEnteryView(text: "Amount of Carbohydrates: ",
                                       textFieldText: "Carbohydrates",
                                       enteredValue: $carbs,
                                       numPad: true)
                        
                        Button{
                            print("Information entered")
                            
                            
                            //enter all information from variables
                        }label:{
                            Text("Enter information")
                        }
                    }
                    
                    Divider().frame(height: 5).background(Color("Mint"))
                    VStack{
                        Text("or")
                            .padding(5)
                        Button{
                            viewRouter.currentPage = .search
                        }label:{
                            Text("Search")
                                .foregroundColor(Color.black)
                                .font(Font.system(size: 30))
                                .padding()
                                .background(Color("Mint"))
                        }
                        .shadow(radius: 10)
                        Spacer()
                    }
                    
                    
                case.weightEntry:
                    WeightEntryHost()
                    Spacer()
                    
                case.search:
                    Text("Search")
                case.account:
                    ProfileHost()
                        .environmentObject(modelData)
                case.notification:
                    Text("Notifications Page")
                case.logOut:
                    Text("Log Out of Account")
                }
                
                Spacer()
                
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

