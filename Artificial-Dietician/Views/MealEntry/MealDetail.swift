//
//  MealDetail.swift
//  Artificial-Dietician
//
//  Created by Cameron Triplett on 4/30/21.
//

import SwiftUI

struct MealDetail: View {
    
    @State private var showDetail = false
    @EnvironmentObject var modelData: ModelData
    var meal: Meal
    @StateObject var viewRouter: ViewRouter
    @Binding var appendingArray: [String]
    
    var body: some View {
        GeometryReader { geometry in
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
                
                HStack{
                    VStack(alignment: .leading){
                        Text("Amount of Servings")
                            .font(.system(size: 15, weight: .bold))
                        Text("Serving size \(meal.servingSize) \(meal.servingSizeUnit)")
                    }
                    Spacer()
                    if showDetail{
                        Button(action: {
                            showDetail = false
                            appendingArray.append(meal.itemName)
                        }) {
                            Text("Confirm")
                        }
                        
                    }
                    Spacer()
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
