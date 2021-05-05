//
//  ViewRouter.swift
//  Artificial-Dietician
//
//  The router for what page the user is on depending on what tab icon is clicked on
//  Created by Cameron Triplett on 4/12/21.
//

import SwiftUI

class ViewRouter: ObservableObject{
    
    @Published var currentPage: Page = .home  //What the assigne page is
}
//cases for the pages
enum Page{
    case home
    case mealEntry
    case weightEntry
    case account
    case notification
    case logOut
}
