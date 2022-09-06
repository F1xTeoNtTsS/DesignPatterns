import UIKit

extension UIColor {
    static var colorStore: [String: UIColor] = [:]
    
    class func rgba(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat) -> UIColor {
        let key = "\(red)\(green)\(blue)\(alpha)"
        
        if let color = self.colorStore[key] {
            return color
        }
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        self.colorStore[key] = color
        return color
    }
}

let flyColor1 = UIColor.rgba(1, 1, 1, 0)
let flyColor2 = UIColor.rgba(1, 1, 1, 0)

print(flyColor1 === flyColor2) // одна и та же ячейка в памяти, много одинаковых объектов = одна ячейка в памяти

let color1 = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0)
let color2 = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0)

print(color1 === color2) // разные ячейки памяти, много одинаковых объектов = много оперативной памяти

