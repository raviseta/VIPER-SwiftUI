//
//  RecipeListRouter.swift
//  RecipeApp
//
//  Created by Ravi Seta on 06/02/25.
//

protocol RecipeListRouterProtocol {
    func navigateToDetail(recipe: Recipe)
}

final class RecipeListRouter: RecipeListRouterProtocol {
    func navigateToDetail(recipe: Recipe) {
        // Navigation logic
    }
    
    
    static func createModule() -> RecipeListView {
        let networkManager = NetWorkManager()
        let repository = RecipeListRepository(netWorkManager: networkManager)
        let interactor = RecipeListInteractor(recipeListRepository: repository)
        let router: RecipeListRouterProtocol = RecipeListRouter()  // Use protocol
        let presenter = RecipeListPresenter(interactor: interactor, router: router)
        
        let view = RecipeListView(presenter: presenter)
        return view
    }
}
