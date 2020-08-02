//
//  File.swift
//  
//
//  Created by Tanishq Kancharla on 8/2/20.
//

import Foundation

open class Suggester<C: ContentProvider>: ObservableObject {
    let contentProvider: C
    @Published var suggestions: [Suggestion<C.T>]
    var prompt: String = "" {
        didSet {
            self.suggest()
        }
    }
    private let accessQueue: DispatchQueue

    required public init(_ contentProvider: C) {
        self.contentProvider = contentProvider
        self.suggestions = []
        accessQueue = DispatchQueue(label: "com.suggestions", attributes: .concurrent)
    }

    func suggest(){
        self.suggestions = []
        _ = self.contentProvider.content.enumerated()
            .map { i, content in
                let suggestion = Suggestion(prompt, content: content, object: self.contentProvider.objects[i])
                if let suggestion = suggestion {
                    accessQueue.sync {
                        suggestions.append(suggestion)
                    }
                }
            }
    }
}

