//
//  Artificial_DieticianApp.swift
//  Artificial-Dietician
//
//  This application will track a user meals and weight entries
//  Created by Cameron Tripeltt on 4/12/21.
//

import SwiftUI

@main
struct Artificial_DieticianApp: App {
    
    @StateObject private var modelData = ModelData()
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewRouter: viewRouter)
                .environmentObject(modelData)
        }
    }
}
