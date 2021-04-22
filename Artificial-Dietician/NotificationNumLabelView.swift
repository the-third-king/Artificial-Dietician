//
//  NotificationNumLabelView.swift
//  Artificial-Dietician
//
//  Created by user192665 on 4/21/21.
//

import SwiftUI

struct NotificationNumLabelView: View {
    
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
        return numOfDigits() == Float(1) ? 1.5 : numOfDigits()
    }
}

struct NotificationNumLabelView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationNumLabelView(number: Binding.constant(0))
    }
}
