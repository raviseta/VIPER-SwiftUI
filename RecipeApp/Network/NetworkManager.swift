//
//  NetworkManager.swift
//  RecipeApp
//
//  Created by Ravi Seta on 24/01/25.
//

import Foundation
import UIKit

// MARK: - API ResponseHandler
typealias APIResponseHandler<T: Decodable> = ((ResponseHandler<T>) -> Void)
enum ResponseHandler<T: Decodable> {
    case success(result: T)
    case failure(error: Error)
}

// MARK: - NetworkManager

protocol NetWorkManagerProtocol {
    func request<T: Decodable>(
        endpoint: APIURL,
        parameters: Encodable?,
        responseType: T.Type) async throws -> ResponseHandler<T>
}

final class NetWorkManager: NetWorkManagerProtocol {
    
    fileprivate func checkNetworkConnection() throws {
        guard Reachability.isConnectedToNetwork() else {
            throw APIError.noInternet
        }
    }
    
    func request<T: Decodable>(
        endpoint: APIURL,
        parameters: Encodable?,
        responseType: T.Type) async throws -> ResponseHandler<T> {
            
            let session = URLSession(configuration: .default)
            
            try checkNetworkConnection()
            
            guard let urlComponents = URLComponents.init(string: endpoint.getURL()) else {
                return .failure(error: APIError.invalidURL)
                
            }
            
            guard let url = urlComponents.url else {
                return .failure(error: APIError.invalidURL)
            }
            
            let (data, httpResponse) = try await session.data(from: url)
            
            guard (httpResponse as? HTTPURLResponse)?.statusCode == ResponseCode.success.rawValue else {
                return .failure(error: APIError.invalidResponse)
            }
            
            do {
                let response = try JSONDecoder().decode(responseType.self, from: data)
                return .success(result: response)
            } catch {
                return .failure(error: APIError.invalidResponse)
            }
            
        }
    
}
