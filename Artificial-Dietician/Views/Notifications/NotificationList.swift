//
//  NotificationList.swift
//  Artificial-Dietician
//
//  This page show the notifications and finds whta notifications the user can have
//  Created by Cameron Triplett on 5/3/21.
//

import SwiftUI

struct NotificationList: View {
    
    @EnvironmentObject var modelData: ModelData //Profile instance
    
    var body: some View {
        //array for available notifications
        let notifications: [Notification] = findNotifications(modelData: modelData)
        NavigationView{
            VStack{
                PageLabelView(pageTitle: "Notifications")
                //Show notifications in a scrollable view
                ScrollView{
                    ForEach(notifications, id: \.self){ notification in
                        NavigationLink(destination: NotificationDetail(title: notification.title, content: notification.content)){
                            NotificationPreview(title: notification.title, contentPreview: notification.content)
                                .padding(.bottom, 82)
                        }
                        .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

//find what notification the user has
//modelData: the user profile instance
//return: the array of notifications
func findNotifications(modelData: ModelData) -> [Notification]{
    var notificationsAvailable: [Notification] = []
    //They have achieved 5 days in a row
    if(Int(modelData.profile.daysInARow)! > 5){
        notificationsAvailable.append(Notification(title: "Nice Streak", content: "You have been on this app for more than 5 days in a row.  Keep up the good work and you will see the results you are looking for in no time at all!!"))
    }
    //If they have acieved their goal weight
    if(Int(modelData.profile.goalWeight)! > Int(modelData.profile.weight)!){
        notificationsAvailable.append(Notification(title: "Congradulations", content: "You have officially reached your goal weight.  Way to stick to the program and reach your goals.  Go to your account page and update your goal wieght to keep reaching new heights in your health"))
    }
    //modelData.profile.numberNotifications = notificationsAvailable.count
    return notificationsAvailable
}

//The notification struct
struct Notification: Hashable {
    var title: String
    var content: String
}

struct NotificationList_Previews: PreviewProvider {
    static var previews: some View {
        NotificationList()
            .environmentObject(ModelData())
    }
}
