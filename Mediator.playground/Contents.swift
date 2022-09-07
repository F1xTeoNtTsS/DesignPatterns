import Foundation

enum Event {
    case turnOn, connection, pawsEngineReady, executingProgram, turnOff
    
    enum Program {
        case fun, walk, security
    }
}

protocol Mediator {
    func notify(component: Component, event: Event)
}

protocol Component {
    var mediator: Mediator? { get set }
}

class BodyEngine: Component {
    var mediator: Mediator?
    
    func turnOn() {
        print("Body stabilized and ready to start.\n")
        mediator?.notify(component: self, event: .turnOn)
    }
    
    func turnOff() {
        print("Move body to default state... RoboDog is turn off.\n")
        mediator?.notify(component: self, event: .turnOff)
    }
}

class InternetConnector: Component {
    var mediator: Mediator?
    private var isConnected: Bool = false
    
    func connectToInternet() {
        if !self.isConnected {
            self.isConnected = true
        }
        print("Internet is connected.\n")
        mediator?.notify(component: self, event: .connection)
    }
}

class PawsEngine: Component {
    var mediator: Mediator?
    
    func executePawsEngine() {
        print("Paws is ready to move.\n")
        mediator?.notify(component: self, event: .pawsEngineReady)
    }
}

class MuzzleViewer: Component {
    var mediator: Mediator?
    
    func showMuzzle(program: Event.Program) {
        switch program {
        case .fun:
            print("🐶 🤡\n")
        case .walk:
            print("🐶 🐕\n")
        case .security:
            print("🐶 🚨\n")
        }
        
        mediator?.notify(component: self, event: .executingProgram)
    }
}

class RoboDogController: Mediator {
    
    var bodyEngine: BodyEngine
    var internetConnector: InternetConnector
    var pawsEngine: PawsEngine
    var muzzleViewer: MuzzleViewer
    
    private var program: Event.Program?
    
    init(bodyEngine: BodyEngine,
         internetConnector: InternetConnector,
         pawsEngine: PawsEngine,
         muzzleViewer: MuzzleViewer) {
        self.bodyEngine = bodyEngine
        self.internetConnector = internetConnector
        self.pawsEngine = pawsEngine
        self.muzzleViewer = muzzleViewer
        
        self.setupMediators()
    }
    
    
    func notify(component: Component, event: Event) {
        switch event {
        case .turnOn:
            self.internetConnector.connectToInternet()
        case .connection:
            self.pawsEngine.executePawsEngine()
        case .pawsEngineReady:
            guard let program = program else {
                return
            }
            self.muzzleViewer.showMuzzle(program: program)
        case .executingProgram:
            print("Program is executing now...\n")
        default:
            break
        }
    }
    
    func turnOnRoboDog(program: Event.Program) {
        self.program = program
        self.bodyEngine.turnOn()
    }
    
    func turnOffRoboDog() {
        self.bodyEngine.turnOff()
    }
    
    func setupMediators() {
        self.bodyEngine.mediator = self
        self.internetConnector.mediator = self
        self.pawsEngine.mediator = self
        self.muzzleViewer.mediator = self
    }
}

let bodyEngine = BodyEngine()
let internetConnector = InternetConnector()
let pawsEngine = PawsEngine()
let muzzleViewer = MuzzleViewer()

let controller = RoboDogController(bodyEngine: bodyEngine,
                                   internetConnector: internetConnector,
                                   pawsEngine: pawsEngine,
                                   muzzleViewer: muzzleViewer)

controller.turnOnRoboDog(program: .security)
controller.turnOffRoboDog()


