protocol UnitProtocol {
    var name: String { get }
    var rank: Int { get }
}

protocol UnitBuilderProtocol {
    func setName(_ name: String)
    func setRank(_ rank: Int)
    func makeUnit() -> UnitProtocol?
}

class Unit: UnitProtocol {
    let name: String
    let rank: Int
    
    init(name: String, rank: Int) {
        self.name = name
        self.rank = rank
    }
}

class UnitBuilder: UnitBuilderProtocol {
    
    private var name: String?
    private var rank: Int?
    
    func setName(_ name: String) {
        self.name = name
    }
    
    func setRank(_ rank: Int) {
        self.rank = rank
    }
    
    func makeUnit() -> UnitProtocol? {
        guard let name = self.name, let rank = self.rank else { return nil }
        
        return Unit(name: name, rank: rank)
    }
}

let builder = UnitBuilder()
builder.setName("Vasya")
builder.setRank(10)
builder.makeUnit()
