//
//  AutocompleteExampleViewApp.swift
//  Shared
//
//  Created by Tanishq Kancharla on 8/2/20.
//

import SwiftUI

@main
struct AutocompleteExampleViewApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(allDogs: makeAllDogs())
        }
    }
}
