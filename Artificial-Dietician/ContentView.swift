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
    @State private var weight: String = ""
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                HStack{
                    Image(systemName: "bell")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16, height: 16)
                        .padding(.top, 40)
                        .padding(.leading, 10)
                        //.overlay(NotificationNumLabel(number: $labelNumber))
                        .onTapGesture{
                            viewRouter.currentPage = .notification
                        }
                    Spacer()
                    Text("Artificial Dietician")
                        .bold()
                        .padding(.top, 40)
                        .font(Font.system(size: 25))
                    Spacer()
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16, height: 16)
                        .padding(.top, 40)
                        .padding(.trailing, 10)
                        .onTapGesture{
                            viewRouter.currentPage = .account
                        }
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
                        Text("Home")
                            .bold()
                            .font(Font.system(size: 35))
                            .padding(8)
                            .overlay(RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color("Mint"), lineWidth: 5))
                        HStack{
                            Text("Calories Eaten Today: ")
                                .padding()
                            //Add calorie data from Database here
                            Spacer()
                        }
                        .frame(width: 350,
                               height: 70,
                               alignment: .leading)
                        .background(LinearGradient(gradient: Gradient(colors: [.gray, Color("Mint")]),
                                                   startPoint: .leading,
                                                   endPoint: .trailing))
                        .cornerRadius(50)
                        
                        HStack{
                            Text("Amount of Protien: ")
                                .padding()
                            //Add protien data from database here
                            Spacer()
                        }
                        .frame(width: 350,
                               height: 70,
                               alignment: .leading)
                        .background(LinearGradient(gradient: Gradient(colors: [.gray, Color("Mint")]),
                                                   startPoint: .leading,
                                                   endPoint: .trailing))
                        .cornerRadius(50)
                        .padding()
                        
                        HStack{
                            Text("Amount of carborhydrates: ")
                                .padding()
                            //Add carbs data from database here
                            Spacer()
                        }
                        .frame(width: 350,
                               height: 70,
                               alignment: .leading)
                        .background(LinearGradient(gradient: Gradient(colors: [.gray, Color("Mint")]),
                                                   startPoint: .leading,
                                                   endPoint: .trailing))
                        .cornerRadius(50)
                        
                        Spacer()
                    }
                    
                case.mealEntry:
                    VStack{
                        Text("Meal Entry")
                            .bold()
                            .font(Font.system(size: 35))
                            .padding(8)
                            .overlay(RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color("Mint"), lineWidth: 5))
                        HStack{
                            Text("Meal Type: ")
                            Spacer()
                            TextField("Meal Type", text: $mealName)
                                .modifier(TextFieldClearButton(text: $mealName))
                                .frame(width: 175, height: 25, alignment: .trailing)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.trailing, 4)
                            //store meal type in database
                        }
                        HStack{
                            Text("Amount of Calories: ")
                            Spacer()
                            TextField("Calories", text: $calories)
                                .modifier(TextFieldClearButton(text: $calories))
                                .frame(width: 175, height: 25, alignment: .trailing)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.trailing, 4)
                            //Store calories into database
                        }
                        HStack{
                            Text("Amount of Protien: ")
                            Spacer()
                            TextField("Protien", text: $protien)
                                .modifier(TextFieldClearButton(text: $protien))
                                .frame(width: 175, height: 25, alignment: .trailing)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.trailing, 4)
                            //store protien into database
                        }
                        HStack{
                            Text("Amount of Carbohydrates: ")
                            Spacer()
                            TextField("Carbohydrates", text: $carbs)
                                .modifier(TextFieldClearButton(text: $carbs))
                                .frame(width: 175, height: 25, alignment: .trailing)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.trailing, 4)
                                
                            //store carbs into database
                        }
                        
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
                        Text("Weight")
                            .bold()
                            .font(Font.system(size: 35))
                            .padding(8)
                            .overlay(RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color("Mint"), lineWidth: 5))
                        HStack{
                            Text("New Weight: ")
                            TextField("Weight", text: $weight)
                                .modifier(TextFieldClearButton(text: $weight))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                        }
                    }
                    
                    
                    Divider().frame(height: 5).background(Color("Mint"))
                    VStack{
                        Text("Previous Weights")
                            .font(Font.system(size: 30))
                        HStack{
                            Text("Day 1")
                                .padding()
                        }
                        .frame(width: 350,
                               height: 70,
                               alignment: .leading)
                        .background(LinearGradient(gradient: Gradient(colors: [.gray, Color("Mint")]),
                                                   startPoint: .leading,
                                                   endPoint: .trailing))
                        .cornerRadius(50)
                        .padding(4)
                        HStack{
                            Text("Day 2")
                                .padding()
                        }
                        .frame(width: 350,
                               height: 70,
                               alignment: .leading)
                        .background(LinearGradient(gradient: Gradient(colors: [.gray, Color("Mint")]),
                                                   startPoint: .leading,
                                                   endPoint: .trailing))
                        .cornerRadius(50)
                        .padding(4)
                        HStack{
                            Text("Day 3")
                                .padding()
                        }
                        .frame(width: 350,
                               height: 70,
                               alignment: .leading)
                        .background(LinearGradient(gradient: Gradient(colors: [.gray, Color("Mint")]),
                                                   startPoint: .leading,
                                                   endPoint: .trailing))
                        .cornerRadius(50)
                        .padding(4)
                        HStack{
                            Text("Day 4")
                                .padding()
                        }
                        .frame(width: 350,
                               height: 70,
                               alignment: .leading)
                        .background(LinearGradient(gradient: Gradient(colors: [.gray, Color("Mint")]),
                                                   startPoint: .leading,
                                                   endPoint: .trailing))
                        .cornerRadius(50)
                        .padding(4)
                        
                        HStack{
                            Text("Day 5")
                                .padding()
                        }
                        .frame(width: 350,
                               height: 70,
                               alignment: .leading)
                        .background(LinearGradient(gradient: Gradient(colors: [.gray, Color("Mint")]),
                                                   startPoint: .leading,
                                                   endPoint: .trailing))
                        .cornerRadius(50)
                        .padding(4)
                        
                        Spacer()
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
                               width: geometry.size.width/5,
                               height: geometry.size.height/29,
                               systemIconName: "leaf",
                               tabName: "Meals")
                    TabBarIcon(viewRouter: viewRouter,
                               assignedPage: .weightEntry,
                               width: geometry.size.width/5,
                               height: geometry.size.height/29,
                               systemIconName: "gauge",
                               tabName: "Weight")
                    TabBarIcon(viewRouter: viewRouter,
                               assignedPage: .home,
                               width: geometry.size.width/5,
                               height: geometry.size.height/29,
                               systemIconName: "house",
                               tabName: "Home")
                    TabBarIcon(viewRouter: viewRouter,
                               assignedPage: .search,
                               width: geometry.size.width/5,
                               height: geometry.size.height/29,
                               systemIconName: "magnifyingglass",
                               tabName: "Search")
                    TabBarIcon(viewRouter: viewRouter,
                               assignedPage: .account,
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
            ContentView(viewRouter: ViewRouter())
        }
    }
}

struct TabBarIcon: View {
    
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    
    let width, height: CGFloat
    let systemIconName, tabName: String
    
    var body: some View {
        VStack{
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
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
