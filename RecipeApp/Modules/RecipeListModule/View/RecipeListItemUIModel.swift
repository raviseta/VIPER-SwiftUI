//
//  RecipeListItemViewModel.swift
//  RecipeApp
//
//  Created by Ravi Seta on 06/02/25.
//


import Foundation

class RecipeListItemUIModel: Identifiable, ObservableObject {
    let id: String
    let recipeName: String
    let cuisineType: String
    let imageUrl: String
    
    init(
        id: String,
        recipeName: String,
        cuisineType: String,
        imageUrl: String
    ) {
        self.id = id
        self.recipeName = recipeName
        self.cuisineType = cuisineType
        self.imageUrl = imageUrl
    }
}

extension RecipeListItemUIModel {
    static var placeholder: RecipeListItemUIModel {
        return .init(
            id: UUID().uuidString,
            recipeName: .dummyLongText,
            cuisineType: .dummyLongText,
            imageUrl: "https://example.com/food.png"
        )
    }
}

extension RecipeListItemUIModel {
    
    convenience init(item: Recipe) {
        self.init(
            id: item.uuid,
            recipeName: item.name,
            cuisineType: item.cuisine,
            imageUrl: item.imageURL
            
        )
    }
    
}
