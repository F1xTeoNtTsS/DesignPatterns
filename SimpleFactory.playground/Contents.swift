protocol Knight {
    func maxPower() -> Double
    func armorSet() -> [String]
}

class SimpleKnight: Knight {
    func maxPower() -> Double {
        return 10
    }
    
    func armorSet() -> [String] {
        return ["Chain mail", "Knife"]
    }
}

class LegendaryKnight: Knight {
    func maxPower() -> Double {
        return 50
    }
    
    func armorSet() -> [String] {
        return ["Elemental sword", "Imperial Crusader set"]
    }
}

class KnightFactory {
    enum KnightType {
        case simple, legendary
    }
    
    static func makeKnight(knightType: KnightType) -> Knight {
        switch knightType {
        case .simple:
            return SimpleKnight()
        case .legendary:
            return LegendaryKnight()
        }
    }
}

let simpleKnight = KnightFactory.makeKnight(knightType: .simple)
let legendaryKnight = KnightFactory.makeKnight(knightType: .legendary)
