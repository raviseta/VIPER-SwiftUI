//
//  RecipeEntity.swift
//  RecipeApp
//
//  Created by Ravi Seta on 05/02/25.
//

import Foundation

// MARK: - RecipeList
struct RecipeList: Decodable {
    let recipes: [RecipeDTO]
}

// MARK: - RecipeDTO
struct RecipeDTO: Decodable {
    let cuisine, name: String
    let photoURLLarge, photoURLSmall: String
    let sourceURL: String?
    let uuid: String
    let youtubeURL: String?

    enum CodingKeys: String, CodingKey {
        case cuisine, name
        case photoURLLarge = "photo_url_large"
        case photoURLSmall = "photo_url_small"
        case sourceURL = "source_url"
        case uuid
        case youtubeURL = "youtube_url"
    }
}

struct Recipe: Identifiable {
    var id: String {
        return uuid
    }
    let uuid: String
    let cuisine, name: String
    let imageURL: String
}

