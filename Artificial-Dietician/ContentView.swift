//  Cameron Triplett
//  ContentView.swift
//  Artificial-Dietician
//
//  Created by Cameron Triplett on 4/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewRouter: ViewRouter
    //@State var labelNumber = 1
    //@State private var date: Date = Date()
    @State private var mealName: String = ""
    @State private var calories: String = ""
    @State private var protien: String = ""
    @State private var carbs: String = ""
    @State private var weight: String  = ""
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                HStack{
                    TopBarIcon(viewRouter: viewRouter,
                               assignedPage: .notification,
                               edge: .leading,
                               systemIconName: "bell")
                    Spacer()
                    Text("Artificial Dietician")
                        .bold()
                        .padding(.top, 40)
                        .font(Font.system(size: 25))
                    Spacer()
                    TopBarIcon(viewRouter: viewRouter,
                               assignedPage: .account,
                               edge: .trailing,
                               systemIconName: "person.crop.circle")
                }
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
                        
                        UserEnterView(text: "Meal Type",
                                      textFieldText: "Meal Type",
                                      enteredValue: $mealName)
                        
                        UserEnterView(text: "Amount of Calories",
                                     textFieldText: "Calories",
                                     enteredValue: $calories)
                        
                        UserEnterView(text: "Amount of Protien: ",
                                      textFieldText: "Protien",
                                      enteredValue: $protien)
                        
                        UserEnterView(text: "Amount of Carbohydrates: ",
                                      textFieldText: "Carbohydrates",
                                      enteredValue: $carbs)
                        
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
                    VStack{
                        PageLabelView(pageTitle: "Weight")
                        
                        UserEnterView(text: "New Weight:",
                                      textFieldText: "Weight",
                                      enteredValue: $weight)
                        Button{
                            //TODO: put the wieght into the database
                            print("weight entered")
                        }label: {
                            Text("Confirm Weight")
                        }
                        Spacer()
                    }
                    Divider().frame(height: 5).background(Color("Mint"))
                    
                    VStack{
                        Text("Previous Weights")
                            .font(Font.system(size: 30))
                        BorderedTextView(informativeText: "Day 1: ")
                        
                        BorderedTextView(informativeText: "Day 2: ")
                        
                        BorderedTextView(informativeText: "Day 3: ")
                                                
                        BorderedTextView(informativeText: "Day 4: ")
                        
                        BorderedTextView(informativeText: "Day 5: ")
                    }
                    Spacer()
                    
                case.search:
                    Text("Search")
                case.account:
                    Text("Account")
                case.notification:
                    Text("Notifications Page")
                }
                
                Spacer()
                HStack{
                    TabBarIcon(viewRouter: viewRouter,
                               assignedPage: .mealEntry,
                               padding: .top,
                               width: geometry.size.width/5,
                               height: geometry.size.height/29,
                               systemIconName: "leaf",
                               tabName: "Meals")
                    TabBarIcon(viewRouter: viewRouter,
                               assignedPage: .weightEntry, padding: .top,
                               width: geometry.size.width/5,
                               height: geometry.size.height/29,
                               systemIconName: "gauge",
                               tabName: "Weight")
                    TabBarIcon(viewRouter: viewRouter,
                               assignedPage: .home, padding: .top,
                               width: geometry.size.width/5,
                               height: geometry.size.height/29,
                               systemIconName: "house",
                               tabName: "Home")
                    TabBarIcon(viewRouter: viewRouter,
                               assignedPage: .search, padding: .top,
                               width: geometry.size.width/5,
                               height: geometry.size.height/29,
                               systemIconName: "magnifyingglass",
                               tabName: "Search")
                    TabBarIcon(viewRouter: viewRouter,
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
        }
    }
}

struct TabBarIcon: View {
    
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

struct TextFieldClearButton: ViewModifier{
    
    @Binding var text: String
    
    func body(content: Content) -> some View{
        
        HStack{
            content
            if !text.isEmpty{
                Button{
                    self.text = ""
                }label:{
                    Image(systemName: "delete.left")
                        .foregroundColor(Color(UIColor.opaqueSeparator))
                }
            }
        }
    }
}

/*
struct NotificationNumLabel : View {
    
    @Binding var number: Int
    
    var body: some View {
        ZStack{
            Capsule()
                .fill(Color.red)
                .frame(width: 20 * CGFloat(numOfDigits()),
                       height: 45,
                       alignment: .topTrailing)
                .position(CGPoint(x: 150, y: 0))
            
            Text("\(number)")
                .foregroundColor(Color.white)
                .font(Font.system(size: 35).bold()).position(CGPoint(x: 150, y: 0))
        }
    }
    
    func numOfDigits() -> Float {
        let numofDigits = Float(String(number).count)
        return numOfDigits == 1 ? 1.5 : numOfDigits()
    }
}
 */

struct BorderedTextView: View {
    
    let informativeText: String
    
    var body: some View {
        HStack{
            Text(informativeText)
                .padding()
        }
        .frame(width: 350,
               height: 70,
               alignment: .leading)
        .background(LinearGradient(gradient: Gradient(colors: [.gray, Color("Mint")]),
                                   startPoint: .leading,
                                   endPoint: .trailing))
        .cornerRadius(50)
    }
}

struct UserEnterView: View {
    
    let text: String
    let textFieldText: String
    @Binding var enteredValue: String
    
    
    var body: some View {
        HStack{
            Text(text)
            Spacer()
            TextField(textFieldText, text: $enteredValue)
                .modifier(TextFieldClearButton(text: $enteredValue))
                .frame(width: 175, height: 25, alignment: .trailing)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.trailing, 4)
            
            //store carbs into database
        }
    }
}

struct PageLabelView: View {
    
    let pageTitle: String
    
    var body: some View {
        Text(pageTitle)
            .bold()
            .font(Font.system(size: 35))
            .padding(8)
            .overlay(RoundedRectangle(cornerRadius: 30)
                        .stroke(Color("Mint"), lineWidth: 5))
    }
}

struct TopBarIcon: View {
    
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
            //.overlay(NotificationNumLabel(number: $labelNumber))
            .onTapGesture{
                viewRouter.currentPage = assignedPage
            }
    }
}
