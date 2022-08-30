
final class Unit {
    public let name: String
    public var staminaPoints: Int
    
    init(staminaPoints: Int, name: String) {
        self.name = name
        self.staminaPoints = staminaPoints
    }
}

protocol Command {
    func execute()
    var isComplete: Bool { get set }
}

class Attack: Command {
    
    var isComplete = false
    
    private var unit: Unit
    private var staminaPointsToReduce: Int
    
    init(unit: Unit, staminaPointsToReduce: Int) {
        self.unit = unit
        self.staminaPointsToReduce = staminaPointsToReduce
    }
    
    func execute() {
        guard self.unit.staminaPoints >= self.staminaPointsToReduce else {
            print("Not enough stamina points to attack")
            return
        }
        self.unit.staminaPoints -= self.staminaPointsToReduce
        self.isComplete = true
    }
}

class Defense: Command {
    
    var isComplete = false
    
    private var unit: Unit
    private var staminaPointsToReplenish: Int
    
    init(unit: Unit, staminaPointsToReplenish: Int) {
        self.unit = unit
        self.staminaPointsToReplenish = staminaPointsToReplenish
    }
    
    func execute() {
        self.unit.staminaPoints += self.staminaPointsToReplenish
        if self.unit.staminaPoints > 100 {
            self.unit.staminaPoints = 100
        }
        self.isComplete = true
    }
}

class ActionManager {
    static let shared = ActionManager()
    private init() {}
    
    private var actions: [Command] = []
    
    var pendingActions: [Command] {
        get {
            return self.actions.filter { !$0.isComplete }
        }
    }
    
    func addAction(command: Command) {
        self.actions.append(command)
    }
    
    func processingActions() {
        self.actions.filter { !$0.isComplete }.forEach { $0.execute() }
    }
}

let unitVasya = Unit(staminaPoints: 100, name: "Vasya")
ActionManager.shared.addAction(command: Attack(unit: unitVasya, staminaPointsToReduce: 50))
ActionManager.shared.addAction(command: Attack(unit: unitVasya, staminaPointsToReduce: 5))
ActionManager.shared.pendingActions.count
unitVasya.staminaPoints
ActionManager.shared.processingActions()
unitVasya.staminaPoints

ActionManager.shared.addAction(command: Defense(unit: unitVasya, staminaPointsToReplenish: 999))
ActionManager.shared.processingActions()
unitVasya.staminaPoints
