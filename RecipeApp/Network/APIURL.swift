//
//  APIBaseURL.swift
//  RecipeApp
//
//  Created by Ravi Seta on 24/01/25.
//


import Foundation

enum APIBaseURL: String {
    
    case baseURLLive = "https://d3jbb8n5wk0qxi.cloudfront.net/"
    
    static func getBaseURL() -> String {
        switch AppEnvironment.shared.environmentType {
        case .production:
            return APIBaseURL.baseURLLive.rawValue
        }
    }
}

enum APIURL {
    case getRecipeList
    case none
    
    func getURL() -> String {
        let baseURL = APIBaseURL.getBaseURL()
        
        switch self {
        case .getRecipeList:
            return baseURL + "recipes.json"
        case .none :
            return ""
        }
        
    }
}
