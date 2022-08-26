import Foundation

protocol Subject {
    func addObserver(observer: PropertyObserver)
    func removeObserver(observer: PropertyObserver)
    func giveTaskToObservers(task: String)
    
}

protocol PropertyObserver {
    func getTask(newTask: String)
}

class King: Subject {
    
    var observers = NSMutableSet()
    var task = "" {
        didSet {
            self.giveTaskToObservers(task: task)
        }
    }
    
    func addObserver(observer: PropertyObserver) {
        self.observers.add(observer)
    }
    
    func removeObserver(observer: PropertyObserver) {
        self.observers.remove(observer)
    }
    
    func giveTaskToObservers(task: String) {
        self.observers.forEach {
            ($0 as? PropertyObserver)?.getTask(newTask: task)
        }
    }
}

class Minister: NSObject, PropertyObserver {
    var task: String = ""
    
    func getTask(newTask: String) {
        self.task = newTask
        print("Minister has new task from king is - \(task)")
    }
}

class Knight: NSObject, PropertyObserver {
    var task: String = ""
    
    func getTask(newTask: String) {
        self.task = newTask
        print("Knight has new task from king is - \(task)")
    }
}

let king = King()
let minister = Minister()
let knight = Knight()

king.addObserver(observer: minister)
king.addObserver(observer: knight)

king.task = "make some coffee"


