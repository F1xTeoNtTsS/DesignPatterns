import Foundation

protocol Unit {
    var badgeId: UInt32 { get }
    func description() -> String
}

class Knight: Unit {
    var badgeId = arc4random_uniform(100)
    
    func description() -> String {
        return "Knight badgeId - \(self.badgeId) |"
    }
}

class Archer: Unit {
    var badgeId = arc4random_uniform(100)
    
    func description() -> String {
        return "Archer badgeId - \(self.badgeId) |"
    }
}

class Commander: Unit {
    var units: [Unit] = []
    var badgeId = arc4random_uniform(100)
    let rank: String
    
    init(rank: String) {
        self.rank = rank
    }
    
    func add(unit: Unit) {
        self.units.append(unit)
    }
    
    func remove(unit: Unit) {
        if let index = self.units.firstIndex(where: { $0.badgeId == unit.badgeId }) {
            self.units.remove(at: index)
        }
    }
    
    func description() -> String {
        var str: String = "\(rank) badgeId - \(badgeId) |"
        self.units.forEach { str.append($0.description()) }
        return str
    }
}


let general = Commander(rank: "General")

let lieutenant1 = Commander(rank: "Lieutenant")
general.add(unit: lieutenant1)
let archer = Archer()
let knight = Knight()

let lieutenant2 = Commander(rank: "Lieutenant 2")
general.add(unit: lieutenant2)

lieutenant1.add(unit: archer)
lieutenant1.add(unit: knight)

//print(lieutenant.description())
print(general.description())

