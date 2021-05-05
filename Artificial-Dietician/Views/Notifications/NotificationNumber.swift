//
//  NotificationNumber.swift
//  Artificial-Dietician
//
//  Created by Cameron Triplett on 5/3/21.
//  not implemented yet becuase of an infiinite loop somewhere

import SwiftUI
/*
struct NotificationNumber: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        ZStack{
            Capsule()
                .fill(Color.red)
                .frame(width: 7 * CGFloat(numOfDigits(modelData: modelData)),
                       height: 15,
                       alignment: .topTrailing)
                .position(CGPoint(x: 150, y: 0))
            
            Text("\(modelData.profile.numberNotifications)")
                .foregroundColor(Color.white)
                .font(Font.system(size: 10).bold()).position(CGPoint(x: 150, y: 0))
        }
    }
}

func numOfDigits(modelData: ModelData)->CGFloat{
    var numDigits: CGFloat = 0
    if(modelData.profile.numberNotifications > 9){
        numDigits = 2
    }
    else{
        numDigits = 1
    }
    return numDigits
}


struct NotificationNumber_Previews: PreviewProvider {
    static var previews: some View {
        NotificationNumber()
            .environmentObject(ModelData())
    }
}
 */
