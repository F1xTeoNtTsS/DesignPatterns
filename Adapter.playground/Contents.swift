protocol Soldier {
    func powerLevel(staminaPoints: Int, heathPoints: Int) -> Int
}

struct Person: Soldier {
    func powerLevel(staminaPoints: Int, heathPoints: Int) -> Int {
        return staminaPoints + heathPoints
    }
}

protocol Knight {
    func minMaxPower(staminaPoints: Int, heathPoints: Int, armorLevel: Int) -> [Int]
}

struct KnightAdapter: Knight {
    private var adaptee: Soldier
    
    init(adaptee: Soldier) {
        self.adaptee = adaptee
    }
    
    func minMaxPower(staminaPoints: Int, heathPoints: Int, armorLevel: Int) -> [Int] {
        let minLevel = self.adaptee.powerLevel(staminaPoints: staminaPoints, heathPoints: heathPoints)
        let maxLevel = minLevel + armorLevel
        return [minLevel, maxLevel]
    }
}

struct KnightCheckCenter {
    func checkKnight(knight: Knight) {
        let minMax = knight.minMaxPower(staminaPoints: 100, heathPoints: 100, armorLevel: 2)
        print("Knight min power level: \(minMax[0])")
        print("Knight max power level: \(minMax[1])")
    }
}

let knightCheckCenter = KnightCheckCenter()
knightCheckCenter.checkKnight(knight: KnightAdapter(adaptee: Person()))
