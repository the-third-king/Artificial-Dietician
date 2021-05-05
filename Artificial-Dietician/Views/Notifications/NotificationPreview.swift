//
//  NotificationPreview.swift
//  Artificial-Dietician
//
//  This page is what a notification preview would look like
//  Created by Cameron Triplett on 5/3/21.
//

import SwiftUI

struct NotificationPreview: View {
    
    @State var read: Bool = false //If the notification has been read
    var title: String //The tile of the notification
    var contentPreview: String //The content of the notification

    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    //if not read then show unread symbol else take off unread symbol
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
                            .lineLimit(2)
                            .padding([.leading, .bottom,. trailing], 6)
                        Spacer()
                    }
                }
            }
            .frame(width: geometry.size.width, height: 100, alignment: .leading)
            .border(Color("Mint"),width: 5)
            .background(Color("OpacMint"))
        }
        //when tapped twice the unread symbol turns off
        .onTapGesture(count: 2, perform: {
            read.toggle()
        })
    }
}

struct NotificationPreview_Previews: PreviewProvider {
    static var previews: some View {
        NotificationPreview(title: "Title", contentPreview: "Content Preview")
    }
}
