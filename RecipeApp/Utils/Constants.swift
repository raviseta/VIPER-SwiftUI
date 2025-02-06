//
//  Constants.swift
//  RecipeApp
//
//  Created by Ravi Seta on 24/01/25.
//


let applicationName = "Recipe App"

enum ErrorMessage: String {
    case invalidURL = "Invalid URL."
    case noInternet = "Internet not Available."
    case invalidResponse = "Invalid Response."
    case requestTimeOut = "Request time out."
    case noError = "No Error."
    case fileNotFound = "Unable to find file."
    case unknownError = "Unknown error."
    case emptyState = "Please check after some time."
}

enum ErrorDomain: String {
    case APIDomain = "API"
}

enum ResponseCode: Int {
    case success = 200
}

enum Images: String {
    case placeHolderImage = "recipe.placeholder"
}
