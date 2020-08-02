//
//  File.swift
//  
//
//  Created by Tanishq Kancharla on 8/2/20.
//

import Foundation

public protocol ContentProvider {
    associatedtype T: Identifiable
    var content: [String] {get}
    var objects: [T] {get}

    func makeSuggester() -> Suggester<Self>
}

public extension ContentProvider {
    func makeSuggester() -> Suggester<Self> {
        return Suggester(self)
    }
}
