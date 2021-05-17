//
//  ContentProvider.swift
//  AutocompleteExampleView (iOS)
//
//  Created by Tanishq Kancharla on 8/2/20.
//

import Foundation
import AutocompleteView

struct Dog: Identifiable, Codable {
    // The breed name
    var id: String
}

final class AllDogs: ContentProvider {
    typealias T = Dog

    var objects: [Dog]
    var content: [String]

    init(dogs: [Dog]){
        self.objects = dogs
        self.content = dogs.map({
            $0.id
        })
    }
}

func makeAllDogs() -> AllDogs {
    let decoder = JSONDecoder()
    let dogsData = NSData(contentsOfFile: "./dogs.json")
    let dogs = try! decoder.decode(Array<String>.self, from: dogsData)
    return AllDogs(dogs: dogs.map{
        Dog(id: $0)
    })

}



