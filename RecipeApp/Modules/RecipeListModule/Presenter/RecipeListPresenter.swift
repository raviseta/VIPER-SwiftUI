//
//  Untitled.swift
//  RecipeApp
//
//  Created by Ravi Seta on 05/02/25.
//

import Foundation

protocol RecipeListPresenterProtocol: AnyObject {
    func getRecipeData()
}

final class RecipeListPresenter: ObservableObject, RecipeListPresenterProtocol {
    @Published var recipe: [CellDataSource<RecipeListItemUIModel>] = []
    @Published var alertToDisplay: AlertData?
    
    private let interactor: RecipeListInteractorProtocol
    private let router: RecipeListRouterProtocol
    
    init(interactor: RecipeListInteractorProtocol, router: RecipeListRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func getRecipeData() {
        self.recipe = [.loader(.init()), .loader(.init()), .loader(.init())]

        Task {
            do {
                let response = try await interactor.fetchRecipeList()
                await MainActor.run {
                    self.recipe = response.map({ .data(.init(item: $0)) })
                }
            } catch {
                await MainActor.run {
                    self.alertToDisplay = .init(error: error)
                }
            }
        }
    }
}
