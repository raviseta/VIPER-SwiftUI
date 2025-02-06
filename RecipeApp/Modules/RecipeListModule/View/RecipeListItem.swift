//
//  RecipeListItem.swift
//  RecipeApp
//
//  Created by Ravi Seta on 06/02/25.
//

import SwiftUI

struct RecipeListItem: View {
    
    @ObservedObject var viewModel: RecipeListItemUIModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            
            imageView
            
            titleView
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .cornerRadius(8.0)
    }
}

private extension RecipeListItem {
    
    @ViewBuilder
    var imageView: some View {
        if let url = URL(string: viewModel.imageUrl) {
            CachedAsyncImage(url: url)
                .frame(width: imageSize.width, height: imageSize.height)
        }
    }
    
    @ViewBuilder
    var titleView: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(viewModel.recipeName)
                .foregroundStyle(Color.black)
            
            Text(viewModel.cuisineType)
                .foregroundStyle(Color.black)
        }
        
    }
    
    var imageSize: CGSize {
        return .init(width: 80, height: 80)
    }
}
