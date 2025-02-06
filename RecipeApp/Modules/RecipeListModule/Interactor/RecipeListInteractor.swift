//
//  RecipeListInteractor.swift
//  RecipeApp
//
//  Created by Ravi Seta on 05/02/25.
//

protocol RecipeListInteractorProtocol {
    func fetchRecipeList() async throws -> [Recipe]
}

final class RecipeListInteractor: RecipeListInteractorProtocol {
   
    let recipeListRepository: RecipeListRepositoryProtocol

    init(recipeListRepository: RecipeListRepositoryProtocol) {
        self.recipeListRepository = recipeListRepository
    }
    
    func fetchRecipeList() async throws -> [Recipe] {
        
        let recipeDTO = try await recipeListRepository.getRecipes(endpoint: .getRecipeList)
        let recipes = recipeDTO.compactMap({Recipe(uuid: $0.uuid, cuisine: $0.cuisine, name: $0.name, imageURL: $0.photoURLLarge )})
        return recipes
        
    }
}
