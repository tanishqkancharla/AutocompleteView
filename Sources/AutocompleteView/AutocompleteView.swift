import SwiftUI

public struct AutcompleteView<C: ContentProvider>: View {
    @ObservedObject var suggester: Suggester<C>
    let destinationView: ((C.T) -> AnyView)?
    let closure: ((Suggestion<C.T>) -> Void)?
    @State var searching: Bool = false
    public init(suggester: Suggester<C>, destinationView: ((C.T) -> AnyView)? = nil, closure: ((Suggestion<C.T>) -> Void)? = nil) {
        self.suggester = suggester
        self.destinationView = destinationView
        self.closure = closure
    }
    public var body: some View {
        Form{
            Section {
                TextField("Search", text: $suggester.prompt, onEditingChanged: { searching in
                    withAnimation {
                        self.searching = searching
                    }
                }, onCommit: {
                    if suggester.prompt == "" {
                        self.searching = false
                    } else {
                        self.searching = true
                    }
                })
            }
            if searching {
                Section {
                    SuggestionListView(suggester: suggester, destinationView: destinationView, closure: closure)
                }
            }
        }
    }
}
