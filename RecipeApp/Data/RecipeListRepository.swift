//
//  RecipeListRepository.swift
//  RecipeApp
//
//  Created by Ravi Seta on 06/02/25.
//


protocol RecipeListRepositoryProtocol {
    func getRecipes(endpoint: APIURL) async throws -> [RecipeDTO]
}

class RecipeListRepository: RecipeListRepositoryProtocol {
    
    private var netWorkManager: NetWorkManagerProtocol
    
    init(netWorkManager: NetWorkManagerProtocol) {
        self.netWorkManager = netWorkManager
    }
    
    func getRecipes(endpoint: APIURL) async throws -> [RecipeDTO] {
        do {
            let response =  try await netWorkManager.request(endpoint: endpoint, parameters: nil, responseType: RecipeList.self)
            
            switch response {
            case .success(result: let recipeDTO):
                return recipeDTO.recipes
                
            case .failure(error: let error):
                throw error
            }
        } catch {
            throw error
        }
    }
}
