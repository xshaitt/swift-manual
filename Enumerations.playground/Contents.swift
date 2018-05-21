enum CompassPoint {
    case north
    case south
    case east
    case west
}
var directionToHead = CompassPoint.west
directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}
/*
 枚举就是声明的一组常量，简单的可以这么理解
 1.你使用enum关键字，{}里是枚举成员
 2.如果变量或者常量的类型已经确定，如上，可以直接.成员
 3.如果switch没有case枚举的所有成员则必须要有default
 */
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
//枚举成员的原始值也可以是字符串，但必须在枚举声明当中是唯一的
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
//如果是整型枚举的话那么默认第一个是0，后面的比前面大1
let earthsOrder = Planet.earth.rawValue
//所以说rawValue属性存储了枚举的原始值
let possiblePlanet = Planet(rawValue: 70)
//也可以使用原始值初始化，但如果对应的不存在枚举成员的话返回nil
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}
print(evaluate(product))
//枚举的成员同时也可以是一个枚举类型




