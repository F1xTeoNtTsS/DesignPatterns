protocol Copying {
    init(_ prototype: Self)
}

extension Copying {
    public func copy() -> Self {
        return type(of: self).init(self)
    }
}

class Person: Copying {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    required convenience init(_ prototype: Person) {
        self.init(name: prototype.name)
    }
}

let person1 = Person(name: "Vasya")

let person2 = person1.copy()

print(person1 === person2)
