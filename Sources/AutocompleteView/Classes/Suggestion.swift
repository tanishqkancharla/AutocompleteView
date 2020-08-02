//
//  File.swift
//  
//
//  Created by Tanishq Kancharla on 8/2/20.
//

import Foundation

open class Suggestion<T : Identifiable> {
    var context: String
    var promptLoc: Range<String.Index>
    let object: T

    init?(_ prompt: String, content: String, object: T){
        if let range = content.localizedStandardRange(of: prompt) {
            self.context = content
            self.promptLoc = range
            self.object = object
            return
        } else {
            return nil
        }
    }

    init(context: String, promptLoc: Range<String.Index>, object: T){
        self.context = context
        self.promptLoc = promptLoc
        self.object = object
    }
}
