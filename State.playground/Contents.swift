import Foundation

protocol State {
    var description: String { get }
    
    func setUnit(_ unit: Unit)
    
    func create()
    func startTraining()
    func readyToBattle()
    func kill()
}

class Created: State {
    let description = "Created at \(Date())"
    private var unit: Unit?
    
    init() {}
    
    func setUnit(_ unit: Unit) {
        self.unit = unit
    }
    
    func create() { print("Already created")}
    func startTraining() { self.unit?.setState(InTraining()) }
    func readyToBattle() { print("Unit need to be trained") }
    func kill() { self.unit?.setState(Killed()) }
}

class InTraining: State {
    let description = "In training at \(Date())"
    private var unit: Unit?
    
    init() {}
    
    func setUnit(_ unit: Unit) {
        self.unit = unit
    }
    
    func create() {
        print("Stop training")
        self.unit?.setState(Created())
    }
    func startTraining() { print("Training in progress") }
    func readyToBattle() { self.unit?.setState(ReadyToBattle()) }
    func kill() { self.unit?.setState(Killed()) }
}

class ReadyToBattle: State {
    let description = "Ready to battle at \(Date())"
    private var unit: Unit?
    
    init() {}
    
    func setUnit(_ unit: Unit) {
        self.unit = unit
    }
    
    func create() { print("Unit already created") }
    func startTraining() { print("Unit already trained") }
    func readyToBattle() { print("Unit already to battle") }
    func kill() { self.unit?.setState(Killed()) }
}

class Killed: State {
    let description = "Killed at \(Date())"
    private var unit: Unit?
    
    init() {}
    
    func setUnit(_ unit: Unit) {
        self.unit = unit
    }
    
    func create()           { print("Unit is dead") }
    func startTraining()    { print("Unit is dead") }
    func readyToBattle()    { print("Unit is dead") }
    func kill()             { print("Unit is alredy killed") }
}

class Unit {
    var history = "\n Unit history: \n"
    var state: State
    
    init() {
        self.state = Created()
        self.state.setUnit(self)
        self.history += state.description
    }
    
    func setState(_ state: State) {
        self.state = state
        self.state.setUnit(self)
        self.history += "\n\(state.description)"
    }
    
    func create() { self.state.create() }
    func startTraining() { self.state.startTraining() }
    func readyToBattle() { self.state.readyToBattle() }
    func kill() { self.state.kill() }
}

let unit = Unit()
unit.startTraining()
unit.readyToBattle()
unit.kill()

print(unit.history)
