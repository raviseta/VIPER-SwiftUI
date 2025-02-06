//
//  RecipeAppApp.swift
//  RecipeApp
//
//  Created by Ravi Seta on 05/02/25.
//

import SwiftUI

@main
struct RecipeAppApp: App {
    var body: some Scene {
        WindowGroup {
            RecipeListRouter.createModule()
        }
    }
}
