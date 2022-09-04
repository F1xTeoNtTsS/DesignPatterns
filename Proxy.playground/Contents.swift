// Proxy бывает нескольких видов под конкретную ситуацию, но в основном отличаются добавленными действия внутри
// Например идем в объект который отвечает за кэш, а потом обращается к методам сервера

protocol ServerSide {
    func grantAccess()
    func denyAccess()
}

class Server: ServerSide {
    func grantAccess() {
        print("Grant access to user")
    }
    
    func denyAccess() {
        print("Deny access to user")
    }
}

class Proxy: ServerSide {
    private lazy var server = Server()
    
    func grantAccess() {
        AdditionalOperation.isAuthenticated
        ? server.grantAccess()
        : print("Access denied")
    }
    
    func denyAccess() {
        print("Additional operations")
        server.denyAccess()
    }
}

class AdditionalOperation {
    static var isAuthenticated: Bool = true
}

let proxy = Proxy()
proxy.grantAccess()
