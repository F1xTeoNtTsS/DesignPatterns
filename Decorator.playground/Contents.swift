
protocol Knight {
    func totalPower() -> Double
    func equipment() -> [String]
}

class DefaultKnight: Knight {
    func totalPower() -> Double {
        0.2
    }
    
    func equipment() -> [String] {
        ["Pants", "Socks"]
    }
}

class KnightDecorator: Knight {
    private let knight: Knight
    
    required init(knight: Knight) {
        self.knight = knight
    }
    
    func totalPower() -> Double {
        knight.totalPower()
    }
    
    func equipment() -> [String] {
        knight.equipment()
    }
}

class Underwear: KnightDecorator {
    required init(knight: Knight) {
        super.init(knight: knight)
    }
    
    override func totalPower() -> Double {
        return super.totalPower() + 2
    }
    
    override func equipment() -> [String] {
        return super.equipment() + ["Chain mail", "Knife"]
    }
}

class Armor: KnightDecorator {
    required init(knight: Knight) {
        super.init(knight: knight)
    }
    
    override func totalPower() -> Double {
        return super.totalPower() + 10
    }
    
    override func equipment() -> [String] {
        return super.equipment() + ["Bronze helm", "Bronze bots", "Bronze chest", "Bronze armbands"]
    }
}

class Weapon: KnightDecorator {
    required init(knight: Knight) {
        super.init(knight: knight)
    }
    
    override func totalPower() -> Double {
        return super.totalPower() + 20
    }
    
    override func equipment() -> [String] {
        return super.equipment() + ["Bronze sword", "Bronze shield"]
    }
}

var knightVasya: Knight = DefaultKnight()
knightVasya.equipment()
knightVasya.totalPower()

knightVasya = Weapon(knight: Armor(knight: Underwear(knight: knightVasya)))

// or
// knightVasya = Underwear(knight: knightVasya)
// knightVasya = Armor(knight: knightVasya)
// knightVasya = Weapon(knight: knightVasya)

knightVasya.equipment()
knightVasya.totalPower()
