//
//  ContentView.swift
//  Shared
//
//  Created by Tanishq Kancharla on 8/2/20.
//

import SwiftUI
import AutocompleteView

struct ContentView: View {
    @State var allDogs: AllDogs
    var body: some View {
        AutocompleteView.AutcompleteView(suggester: allDogs.makeSuggester())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(allDogs: makeAllDogs())
    }
}
