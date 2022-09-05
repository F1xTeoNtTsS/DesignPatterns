class Enemy {
    var strength: Int
    init(str: Int) {
        self.strength = str
    }
}

protocol UnitChain {
    var strength: Int { get }
    var nextUnit: UnitChain? { get set }
    func shouldDefeatEnemy(_ enemy: Enemy)
    func cantDefeatEnemy()
}

extension UnitChain {
    func cantDefeatEnemy() {
        print("We cant defeat this enemy!")
    }
}

class Soldier: UnitChain {
    let strength = 20
    var nextUnit: UnitChain?
    
    func shouldDefeatEnemy(_ enemy: Enemy) {
        if self.strength > enemy.strength {
            print("Soldier defeat this enemy!")
        } else {
            print("Soldier too weak for defeat this enemy")
            self.nextUnit != nil
            ? nextUnit?.shouldDefeatEnemy(enemy)
            : self.cantDefeatEnemy()
        }
    }
}

class Officer: UnitChain {
    let strength = 60
    var nextUnit: UnitChain?
    
    func shouldDefeatEnemy(_ enemy: Enemy) {
        if self.strength > enemy.strength {
            print("Officer defeat this enemy!")
        } else {
            print("Officer too weak for defeat this enemy")
            self.nextUnit != nil
            ? nextUnit?.shouldDefeatEnemy(enemy)
            : self.cantDefeatEnemy()
        }
    }
}

class General: UnitChain {
    let strength = 101
    var nextUnit: UnitChain?
    
    func shouldDefeatEnemy(_ enemy: Enemy) {
        if self.strength >= enemy.strength {
            print("General defeat this enemy!")
        } else {
            print("General too weak for defeat this enemy")
            self.nextUnit != nil
            ? nextUnit?.shouldDefeatEnemy(enemy)
            : self.cantDefeatEnemy()
        }
    }
}

let enemy = Enemy(str: 101)

let soldier = Soldier()
let officer = Officer()
let general = General()

soldier.nextUnit = officer
officer.nextUnit = general

soldier.shouldDefeatEnemy(enemy)
