//
//  CellDataSource.swift
//  RecipeApp
//
//  Created by Ravi Seta on 25/01/25.
//


import Foundation

public enum CellDataSource<T: Identifiable>: Hashable,
                                             Equatable,
                                             Identifiable {
    case loader(CellLoaderMeta)
    case data(T)
    
    public var id: String {
        switch self {
        case .loader(let meta):
            return meta.id
        case .data(let data):
            if let id = data.id as? Int {
                return String(id)
            } else {
                return data.id as! String
            }
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: CellDataSource<T>,
                           rhs: CellDataSource<T>) -> Bool {
        switch (lhs,rhs) {
        case (.loader(let left),.loader(let right)):
            return left == right
        case (.data(let left),.data(let right)):
            return left.id == right.id
        default:
            return false
        }
    }
    
    public var isLoader: Bool {
        switch self {
        case .loader:
            return true
        default:
            return false
        }
    }
    
    public var data: T? {
        switch self {
        case .loader:
            return nil
        case .data(let t):
            return t
        }
    }
}


public struct CellLoaderMeta: Equatable {
    public init(id: String = UUID().uuidString,
                type: CellLoaderType = .general) {
        self.id = id
        self.type = type
    }
    
    public let id: String
    public let type: CellLoaderType
}


public enum CellLoaderType {
    case general
    case requestForLoadMore
}
