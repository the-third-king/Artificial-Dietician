//
//  Notification.swift
//  Artificial-Dietician
//
//  The notification details page
//  Created by Cameron Triplett on 5/3/21.
//

import SwiftUI

struct NotificationDetail: View {
    
    var title: String //notification title
    var content: String //notification details
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text(title)
                    .font(.system(size: 20, weight: .bold))
                Spacer()
            }
            HStack {
                Text(content)
                    .lineLimit(nil)
                Spacer()
            }
            Spacer()
                
        }
    }
}

struct NotificationDetail_Previews: PreviewProvider {
    static var previews: some View {
        NotificationDetail(title: "Notification Tilte", content: "Notification Body oasdnf[wo gnqwonfg pqworfqwporng wpaonf qwog nqoh gqown gqw[ou gh[qwou ghqwo rhg[owqhr g[qownv [qeonfvq[oeughqw[orh wajnfva iufhg pqwiurgnavnapiu hgqwpgrqwp vqpwu bqpwiuv pwqnfv qwpvun")
    }
}
