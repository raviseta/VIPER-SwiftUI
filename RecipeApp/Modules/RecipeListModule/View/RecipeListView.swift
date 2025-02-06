//
//  RecipeListView.swift
//  RecipeApp
//
//  Created by Ravi Seta on 05/02/25.
//

import SwiftUI

struct RecipeListView: View {
    
    @StateObject var presenter: RecipeListPresenter

    
    var body: some View {
        NavigationStack {
            
            VStack(alignment: .leading) {
                
                recipeListView
            }
            .navigationTitle("Recipes")
            .alert(for: $presenter.alertToDisplay)
            .onAppear {
                presenter.getRecipeData()
            }
            .refreshable { // For Pull to Refresh
                presenter.getRecipeData()
            }
        }
    }
    
    @ViewBuilder
    var recipeListView: some View {
        if presenter.recipe.isEmpty {
            
            emptyStateView
            
        } else {
            List(presenter.recipe, id: \.id) { data in
                switch data {
                case .loader(_):
                    self.prepareListItem(model: .placeholder)
                        .shimmering()
                    
                case .data(let model):
                    self.prepareListItem(model: model)
                        .padding(EdgeInsets(top: 0, leading: 12, bottom: 12, trailing: 12))
                }
            }
            .listStyle(.plain)
        }
    }
    
    @ViewBuilder
    var emptyStateView: some View {
        EmptyStateView(
            viewModel: .init(
                image: .placeHolderImage,
                title: applicationName,
                message: ErrorMessage.emptyState.rawValue,
                size: .init(width: 72, height: 72)
            )
        )
        .frame(maxHeight: .infinity)
    }
    
    func prepareListItem(model: RecipeListItemUIModel) -> some View {
        RecipeListItem(viewModel: model)
            .listRowInsets(EdgeInsets())
            .listRowSeparator(.hidden)
            .frame(maxWidth: .infinity)
            .background(Color.getAppColor(.gray30))
        
    }
}

#Preview {
    RecipeListView(presenter: RecipeListPresenter(interactor: RecipeListInteractor(recipeListRepository: RecipeListRepository(netWorkManager: NetWorkManager())), router: RecipeListRouter()))
}
