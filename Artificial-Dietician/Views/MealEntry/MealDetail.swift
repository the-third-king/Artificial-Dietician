//
//  MealDetail.swift
//  Artificial-Dietician
//
//  This page shows the details of the food selected
//  Created by Cameron Triplett on 4/30/21.
//

import SwiftUI

struct MealDetail: View {
    
    @State private var showDetail = false //Show the servings wheel
    @EnvironmentObject var modelData: ModelData //The meal instance
    var meal: Meal //The actual meal information
    @StateObject var viewRouter: ViewRouter //To change the page
    @Binding var appendingArray: [String] //breakfast/lunch/dinner getting the meal
    
    var body: some View {
        //read size of screen
        GeometryReader { geometry in
            //Give item name, calories, protein, carbs, and fat in a scrollable view
            ScrollView{
                Text(meal.itemName)
                    .font(.system(size: 40, weight: .black, design: .rounded))
                    .padding()
                HStack{
                    VStack{
                        Text("Calories")
                        Text(String(meal.calories) + " cal")
                    }
                    Divider().background(Color.black)
                    VStack{
                        Text("Protein")
                        Text(String(meal.protein) + " g")
                    }
                    Divider().background(Color.black)
                    VStack{
                        Text("Carbohydrates")
                        Text(String(meal.carbohydrates) + " g")
                    }
                    Divider().background(Color.black)
                    VStack{
                        Text("Total Fats")
                        Text(String(meal.fat) + " g")
                    }
                }
                .frame(width: geometry.size.width, height: 100, alignment: .center)
                .border(Color.black)
                
                //create serving wheel
                HStack{
                    VStack(alignment: .leading){
                        Text("Amount of Servings")
                            .font(.system(size: 15, weight: .bold))
                        Text("Serving size \(meal.servingSize) \(meal.servingSizeUnit)")
                    }
                    Spacer()
                    //if button pressed show serving wheel
                    if showDetail{
                        Button(action: {
                            showDetail = false
                            for i in 0..<modelData.meal.servings{
                                appendingArray.append(meal.itemName)
                            }
                        }) {
                            //add to array with servings
                            Text("Confirm")
                        }
                        
                    }
                    Spacer()
                    //create button to show serving wheel
                    Button(action: {
                        self.showDetail.toggle()
                    }) {
                        Image(systemName: "chevron.right.circle")
                            .imageScale(.large)
                            .rotationEffect(.degrees(showDetail ? 90 : 0))
                            .padding()
                            .animation(.easeInOut)
                    }
                }
                //This is the wheel
                if showDetail {
                    Picker("Amount of Servings", selection: $modelData.meal.servings){
                        ForEach(1...100, id: \.self){
                            Text("\($0)")
                        }
                    }
                }
                Spacer()
            }
        }
        .navigationBarTitle("Meal Entry")
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct MealDetail_Previews: PreviewProvider {
    static var previews: some View {
        let appendingArray = ["Egg"]
        
        MealDetail(meal: meals[0], viewRouter: ViewRouter(), appendingArray: .constant(appendingArray))
            .environmentObject(ModelData())
    }
}
