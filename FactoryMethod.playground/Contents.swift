protocol Unit {
    typealias Meter = Int
    func maxFightRange() -> Meter
}

class Soldier: Unit {
    func maxFightRange() -> Meter {
        return 1
    }
}

class Horseman: Unit {
    func maxFightRange() -> Meter {
        return 2
    }
}

class Archer: Unit {
    func maxFightRange() -> Meter {
        return 100
    }
}

protocol TrainingCenter {
    func trainUnit() -> Unit
}

class SoldierTrainingCenter: TrainingCenter {
    func trainUnit() -> Unit {
        return Soldier()
    }
}

class HorsemanTrainingCenter: TrainingCenter {
    func trainUnit() -> Unit {
        return Horseman()
    }
}

class ArcherTrainingCenter: TrainingCenter {
    func trainUnit() -> Unit {
        return Archer()
    }
}

let soldierTrainingCenter = SoldierTrainingCenter()
let soldier1 = soldierTrainingCenter.trainUnit()
let soldier2 = soldierTrainingCenter.trainUnit()

let archerTrainingCenter = ArcherTrainingCenter()
let archer1 = archerTrainingCenter.trainUnit()
let archer2 = archerTrainingCenter.trainUnit()
