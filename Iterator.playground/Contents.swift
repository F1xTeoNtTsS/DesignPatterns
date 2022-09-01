class Unit {
    var isLegendaryUnit: Bool
    var name: String
    
    init(isLegendaryUnit: Bool, name: String) {
        self.isLegendaryUnit = isLegendaryUnit
        self.name = name
    }
}

class UnitsCounter {
    
    enum Iterators {
        case legendaryUnitIterator
        case usualUnitIterator
    }
    
    let iterator: Iterators
    
    init(iterator: Iterators) {
        self.iterator = iterator
    }
    
    private let units = [Unit(isLegendaryUnit: true, name: "Vasya"),
                         Unit(isLegendaryUnit: false, name: "Petya"),
                         Unit(isLegendaryUnit: true, name: "Egor")]
}

extension UnitsCounter: Sequence {
    func makeIterator() -> UnitIterator {
        switch self.iterator {
        case .usualUnitIterator:
            return UsualUnitIterator(units: self.units)
        case .legendaryUnitIterator:
            return LegendaryUnitIterator(units: self.units)
        }
    }
}

class UnitIterator: IteratorProtocol {
    private let units: [Unit]
    private var current = 0
    
    init(units: [Unit]) {
        self.units = units
    }
    
    func next() -> Unit? {
        defer { current += 1 }
        return units.count > current ? units[current] : nil
    }
    
    func allUnits() -> [Unit] {
        return units
    }
}

class LegendaryUnitIterator: UnitIterator {
    
    private let units: [Unit]
    
    override init(units: [Unit]) {
        self.units = units.filter { $0.isLegendaryUnit }
        super.init(units: self.units)
    }
}

class UsualUnitIterator: UnitIterator {
    
    private let units: [Unit]
    
    override init(units: [Unit]) {
        self.units = units.filter { !$0.isLegendaryUnit }
        super.init(units: self.units)
    }
}

let legendaryTrainingCenter = UnitsCounter(iterator: .legendaryUnitIterator)
let legendaryIterator = legendaryTrainingCenter.makeIterator()
let allLegendaryUnits = legendaryIterator.allUnits()

let usualTrainingCenter = UnitsCounter(iterator: .usualUnitIterator)
let usualIterator = usualTrainingCenter.makeIterator()
let allUsualUnits = usualIterator.allUnits()
