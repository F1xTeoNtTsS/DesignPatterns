// Code without Bridge pattern

class Unit {
    let name: String
    let armor: [String]
    let power: Int
    
    init(name: String, armor: [String], power: Int) {
        self.name = name
        self.armor = armor
        self.power = power
    }
}

class Knight: Unit {}
class Archer: Unit {}
class Horseman: Unit {}

class ElvenKnight: Knight {}
class ElvenArcher: Archer {}
class ElvenHorseman: Horseman {}

class OrcKnight: Knight {}
class OrcArcher: Archer {}
class OrcHorseman: Horseman {}

// = 10 классов

// + еще один тип юнитов = 3 класса
class Bomber: Unit {}

class ElvenBomber: Bomber {}
class OrcBomber: Bomber {}

// + еще одна расса = 3 класса

class TrollKnight: Knight {}
class TrollArcher: Archer {}
class TrollBomber: Bomber {}


// Code with Bridge pattern

// abstraction
protocol UnitProtocol {
    var weapon: String { get }
}

class _Knight: UnitProtocol {
    let weapon = "Sword"
}

class _Archer: UnitProtocol {
    let weapon = "Bow"
}

class _Horseman: UnitProtocol {
    let weapon = "Pike"
}

// end

// implementation
protocol Armor {
    var unit: UnitProtocol { get }
    var armor: [String] { get }
}

protocol Power {
    var unit: UnitProtocol { get }
    var power: Int { get }
}

class Elf: Armor, Power {
    let unit: UnitProtocol
    let armor: [String] = ["Elven armor"]
    let power: Int = 10
    
    init(unit: UnitProtocol) {
        self.unit = unit
    }
}

class Orc: Armor, Power {
    let unit: UnitProtocol
    let armor: [String] = ["Orc armor"]
    let power: Int = 5
    
    init(unit: UnitProtocol) {
        self.unit = unit
    }
}

// end

let orcKnight = Orc(unit: _Knight())

// + еще один тип юнитов = 1 класс

class _Bomber: UnitProtocol {
    let weapon = "Bombs"
}

let orcBomber = Orc(unit: _Bomber())

// + еще одна расса = 1 класс

class Troll: Armor, Power {
    let unit: UnitProtocol
    let armor: [String] = ["Troll armor"]
    let power: Int = 8
    
    init(unit: UnitProtocol) {
        self.unit = unit
    }
}

let trollArcher = Troll(unit: _Archer())

