class Person {
    static let shared = Person()
    
    func sayHello() {
        print("Hello")
    }
    
    private init() {}
}

//let a = Person()

Person.shared.sayHello()
