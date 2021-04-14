//
//  ViewRouter.swift
//  Artificial-Dietician
//
//  Created by user192665 on 4/12/21.
//

import SwiftUI

class ViewRouter: ObservableObject{
    
    @Published var currentPage: Page = .weightEntry
}

enum Page{
    case home
    case mealEntry
    case weightEntry
    case search
    case account
    case notification
}
