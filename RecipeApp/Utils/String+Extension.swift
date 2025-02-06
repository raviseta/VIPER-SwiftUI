//
//  String+Extension.swift
//  RecipeApp
//
//  Created by Ravi Seta on 25/01/25.
//

public extension String {
    static var dummyShortText: String { String("eyJlbWFpbCI6InJzZWthcjEwOTRAZ21haWwuY29tIiwibmFtZSI6IlJhamFzZWtoYXIgIFJhamVuZHJhbiAiLCJ0b2tlbl9pZCI6Ijc1NDQ3MmMwLTkzND".suffix(Int.random(in: 8 ... 12))) }
    static var dummyLongText: String { String("eyJlbWFpbCI6InJzZWthcjEwOTRAZ21haWwuY29tIiwibmFtZSI6IlJhamFzZWtoYXIgIFJhamVuZHJhbiAiLCJ0b2tlbl9pZCI6Ijc1NDQ3MmMwLTkzND".suffix(Int.random(in: 10 ... 25))) }
}
