//
//  APIErrors.swift
//  RecipeApp
//
//  Created by Ravi Seta on 24/01/25.
//

import Foundation

enum APIError: Error {
    case noInternet
    case invalidURL
    case invalidResponse
    case timeOut
    case noError
    case fileNotFound
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noInternet:
            return ErrorMessage.noInternet.rawValue
        case .invalidURL:
            return ErrorMessage.invalidURL.rawValue
        case .invalidResponse:
            return ErrorMessage.invalidResponse.rawValue
        case .noError:
            return ErrorMessage.noInternet.rawValue
        case .timeOut:
            return ErrorMessage.noInternet.rawValue
        case .fileNotFound:
            return ErrorMessage.noInternet.rawValue
        }
    }
}
