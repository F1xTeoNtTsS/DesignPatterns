class Attack {
    final func attackAnEnemy() {
        self.preparePosition()
        self.prepareWeapon()
        self.getTarget()
        self.useWeapon()
        self.finish()
    }
    
    func preparePosition() {
        preconditionFailure("Method \(#function) must be overridden")
    }
    
    func prepareWeapon() {
        preconditionFailure("Method \(#function) must be overridden")
    }
    
    func getTarget() {
        print("Capture target")
    }
    
    func useWeapon() {
        preconditionFailure("Method \(#function) must be overridden")
    }
    
    func finish() {
        print("Put weapon down\n")
    }
}

class Knight: Attack {
    override func preparePosition() {
        print("Move forward")
    }
    
    override func prepareWeapon() {
        print("Take the sword")
    }
    
    override func useWeapon() {
        "Swing the sword"
    }
}

class Archer: Attack {
    override func preparePosition() {
        print("Take a stand")
    }
    
    override func prepareWeapon() {
        print("Take the bow")
    }
    
    override func useWeapon() {
        "Shoot arrow"
    }
}

let knight = Knight()
knight.attackAnEnemy()

let archer = Archer()
archer.attackAnEnemy()
