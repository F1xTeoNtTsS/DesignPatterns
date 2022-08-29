
protocol Knight {
    func totalPower() -> Double
    func armorSet() -> [String]
}

class CommonKnight: Knight {
    init() {
        print("I am common knight :(")
    }
    
    func totalPower() -> Double {
        return 10
    }
    
    func armorSet() -> [String] {
        return ["Armor", "Sword"]
    }
}

class LegendaryKnight: Knight {
    func totalPower() -> Double {
        return 50
    }
    
    func armorSet() -> [String] {
        return ["Legendary set", "Legendary sword"]
    }
}

protocol Archer {
    func totalPower() -> Double
    func armorSet() -> [String]
}

class CommonArcher: Archer {
    func totalPower() -> Double {
        return 15
    }
    
    func armorSet() -> [String] {
        return ["Armor", "bow"]
    }
}

class LegendaryArcher: Archer {
    init() {
        print("I am LEGENDARY archer")
    }
    func totalPower() -> Double {
        return 55
    }
    
    func armorSet() -> [String] {
        return ["Legendary bow", "Legendary armor"]
    }
}

protocol TrainingCenter {
    func trainKnight() -> Knight
    func trainArcher() -> Archer
}

class CommonTrainingCenter: TrainingCenter {
    func trainKnight() -> Knight {
        return CommonKnight()
    }
    
    func trainArcher() -> Archer {
        return CommonArcher()
    }
}

class LegendaryTrainingCenter: TrainingCenter {
    func trainKnight() -> Knight {
        return LegendaryKnight()
    }
    
    func trainArcher() -> Archer {
        return LegendaryArcher()
    }
}

let commonTrainingCenter = CommonTrainingCenter()
let commonKnight = commonTrainingCenter.trainKnight()

let legendaryTrainingCenter = LegendaryTrainingCenter()
let legendaryArcher = legendaryTrainingCenter.trainArcher()
