//
//  SwiftUIView.swift
//  
//
//  Created by Tanishq Kancharla on 8/2/20.
//

import SwiftUI

public struct SuggestionListView<C: ContentProvider>: View {
    @ObservedObject var suggester: Suggester<C>
    let destinationView: ((C.T) -> AnyView)?
    let closure: ((Suggestion<C.T>) -> Void)?

    init(suggester: Suggester<C>, destinationView: ((C.T) -> AnyView)? = nil, closure: ((Suggestion<C.T>) -> Void)? = nil) {
        self.suggester = suggester
        self.destinationView = destinationView
        self.closure = closure
    }

    public var body: some View {
        ForEach(suggester.suggestions, id: \.object.id){ suggestion in
            if let destinationView = destinationView {
                NavigationLink(destination: destinationView(suggestion.object)){
                    Button(action: {
                        closure?(suggestion)
                    }) {
                        SuggestionView(suggestion: suggestion)
                    }

                }
            } else {
                Button(action: {
                    closure?(suggestion)
                }) {
                    SuggestionView(suggestion: suggestion)
                }
            }

        }
    }
}
