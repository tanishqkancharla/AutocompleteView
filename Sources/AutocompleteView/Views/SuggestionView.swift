//
//  SwiftUIView.swift
//  
//
//  Created by Tanishq Kancharla on 8/2/20.
//

import SwiftUI

public struct SuggestionView<T: Identifiable>: View {
    let suggestion: Suggestion<T>
    public var body: some View {
        HStack(spacing: 0){
            Text(suggestion.context[..<suggestion.promptLoc.lowerBound])
                .truncationMode(.head)
            Text(suggestion.context[suggestion.promptLoc])
                .bold()
            Text(suggestion.context[suggestion.promptLoc.upperBound...])
                .truncationMode(.tail)
        }
        .lineLimit(1)
    }
}
