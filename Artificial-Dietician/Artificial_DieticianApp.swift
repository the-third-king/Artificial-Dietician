//
//  Artificial_DieticianApp.swift
//  Artificial-Dietician
//
//  Created by user192665 on 4/12/21.
//

import SwiftUI

@main
struct Artificial_DieticianApp: App {
    
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewRouter: viewRouter)
        }
    }
}
