final class RobotLaunchFacade {
    func launchRobot() {
        let robot = Robot()
        robot.plugIn()
        
        let requestManager = RequestManager()
        if !requestManager.isConnected {
            requestManager.connect(robot: robot)
        }
        
        requestManager.sendStartRequest(robot: robot)
        requestManager.sendStopRequest(robot: robot)
    }
}

let facade = RobotLaunchFacade()
facade.launchRobot()

class Robot {
    enum State {
        case disabled
        case ready
        case running
        case stop
    }

    private(set) var state: State = .disabled
    
    func plugIn() {
        self.state = .ready
        print("Robot is ready to launch")
    }
    
    func launch() {
        self.state = .running
        print("Robot is running...")
    }
    
    func stop() {
        self.state = .stop
        print("Robot is stopped")
    }
}

class RequestManager {
    var isConnected: Bool = false
    
    func connect(robot: Robot) {
        switch robot.state {
        case .disabled:
            print("Connecting failed, robot is turn off")
        default:
            self.isConnected = true
        }
    }
    
    func disconnect() {
        self.isConnected = false
    }
    
    func sendStartRequest(robot: Robot) {
        self.isConnected ? robot.launch() : self.printNotConnectedMessage()
    }
    
    func sendStopRequest(robot: Robot) {
        self.isConnected ? robot.stop() : self.printNotConnectedMessage()
    }
    
    private func printNotConnectedMessage() {
        print("Not connected")
    }
}
