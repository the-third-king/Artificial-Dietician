//
//  NotificationPreview.swift
//  Artificial-Dietician
//
//  Created by Cameron Triplett on 5/3/21.
//

import SwiftUI

struct NotificationPreview: View {
    
    @State var read: Bool = false
    var title: String
    var contentPreview: String

    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    if !read{
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 10, height: 10, alignment: .center)
                            .padding(.leading, 6)
                    }
                    VStack(alignment: .leading){
                        Text(title)
                            .bold()
                            .padding([.leading, .top], 6)
                        Text(contentPreview)
                            .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                            .padding([.leading, .bottom,. trailing], 6)
                        Spacer()
                    }
                }
            }
            .frame(width: geometry.size.width, height: 100, alignment: .leading)
            .border(Color("Mint"),width: 5)
            .background(Color("OpacMint"))
        }
        .onTapGesture(count: 2, perform: {
            read = true
        })
    }
}

struct NotificationPreview_Previews: PreviewProvider {
    static var previews: some View {
        NotificationPreview(title: "Title", contentPreview: "Content Preview")
    }
}
