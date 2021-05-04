//
//  NotificationList.swift
//  Artificial-Dietician
//
//  Created by user192665 on 5/3/21.
//

import SwiftUI

struct NotificationList: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        let notifications: [Notification] = findNotifications(modelData: modelData)
        NavigationView{
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

func findNotifications(modelData: ModelData) -> [Notification]{
    var notificationsAvailable: [Notification] = []
    if(Int(modelData.profile.daysInARow)! > 5){
        notificationsAvailable.append(Notification(title: "Nice Streak", content: "You have been on this app for more than 5 days in a row.  Keep up the good work and you will see the results you are looking for in no time at all!!"))
    }
    if(Int(modelData.profile.goalWeight)! > Int(modelData.profile.weight)!){
        notificationsAvailable.append(Notification(title: "Congradulations", content: "You have officially reached your goal weight.  Way to stick to the program and reach your goals.  Go to your account page and update your goal wieght to keep reaching new heights in your health"))
    }
    //modelData.profile.numberNotifications = notificationsAvailable.count
    return notificationsAvailable
}

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
