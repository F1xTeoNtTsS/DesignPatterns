import Foundation

final class TextEditor {
    private(set) var texts: [String] = []
    
    func addText(texts: [String]) {
        self.texts.append(contentsOf: texts)
    }
    
    func saveState() -> Memento {
        return TextMemento(texts: self.texts)
    }
    
    func restore(state: Memento) {
        self.texts = state.texts
    }
}

protocol Memento {
    var texts: [String] { get }
}

class TextMemento: Memento {
    var texts: [String]
    
    init(texts: [String]) {
        self.texts = texts
    }
}

final class Caretaker {
    var states: [Memento] = []
    var currentIndex = 0
    var textEditor: TextEditor
    
    init(textEditor: TextEditor) {
        self.textEditor = textEditor
    }
    
    func save() {
        let tail = self.states.count - 1 - currentIndex
        if tail > 0 { states.removeLast(tail) }
        
        states.append(self.textEditor.saveState())
        self.currentIndex = states.count - 1
    }
    
    func undo(steps: Int) {
        self.currentIndex = steps <= currentIndex ? -steps : 0
        
        self.textEditor.restore(state: self.states[self.currentIndex])
    }
    
    func redo(steps: Int) {
        let newIndex = self.currentIndex + steps
        self.currentIndex = newIndex <= self.states.count - 1 ? newIndex : self.states.count - 1
        
        self.textEditor.restore(state: self.states[self.currentIndex])
    }
}

let textEditor = TextEditor()
let caretaker = Caretaker(textEditor: textEditor)

textEditor.addText(texts: ["Hello"])
caretaker.save()

textEditor.addText(texts: ["Whole"])
caretaker.save()

textEditor.addText(texts: ["World"])
caretaker.save()

print(textEditor.texts)

caretaker.undo(steps: 5)
print(textEditor.texts)

caretaker.redo(steps: 1)
print(textEditor.texts)

