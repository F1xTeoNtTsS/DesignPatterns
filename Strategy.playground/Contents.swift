
protocol AttackBehavior {
    func attack()
}

class BeginerAttackStyle: AttackBehavior {
    func attack() {
        print("Screaming AAA and strike with a sword!")
    }
}

class AdvancedAttackStyle: AttackBehavior {
    func attack() {
        print("Think a little and strike with a sword!")
    }
}

protocol DefenseBehavior {
    func defense()
}

class BeginerDefenseStyle: DefenseBehavior {
    func defense() {
        print("RUN!!!")
    }
}

class AdvancedDefenseStyle: DefenseBehavior {
    func defense() {
        print("Raise the shield!")
    }
}

class Unit {
    private var attackBehavior: AttackBehavior
    private var defenseBehavior: DefenseBehavior
    
    init(attackBehavior: AttackBehavior, defenseBehavior: DefenseBehavior) {
        self.attackBehavior = attackBehavior
        self.defenseBehavior = defenseBehavior
    }
    
    func performAttack() {
        self.attackBehavior.attack()
    }
    
    func performDefense() {
        self.defenseBehavior.defense()
    }
}

let unitVasya = Unit(attackBehavior: BeginerAttackStyle(), defenseBehavior: AdvancedDefenseStyle())
unitVasya.performAttack()
unitVasya.performDefense()

let unitPetya = Unit(attackBehavior: AdvancedAttackStyle(), defenseBehavior: BeginerDefenseStyle())
unitPetya.performAttack()
unitPetya.performDefense()
