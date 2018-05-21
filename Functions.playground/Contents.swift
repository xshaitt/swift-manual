func greet(person: String) -> String {
    return "Hello, " + person + "!"
}
greet(person: "xsh")
/*
 使用func定义函数，参数名与类型用:分开
 函数返回类型用->表示
 参数调用的顺序不能反
 */
func gre(person: String) {
    print("Hello, \(person)!")
}
gre(person: "Dave")
//如果函数没有返回值，那就不使用->指定返回值
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
//多个返回值可以选用元组
func minMax1(array: [Int]) -> (min: Int, max: Int)? {
    //返回的元组是可以为可选值，但一定是整个元组作为可选值，而不是其中某个元素
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
if let bounds = minMax1(array: [8, -6, 2, 109, 3, 71]) {
    bounds
}
func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet(person: "Bill", from: "Cupertino"))
/*
 可能我也是不能明白这个标签有什么用
 标签如果不提供的话与变量名一样，在变量名前加标签名并用空格隔开
 在函数体内使用标签名获取参数值
 */
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    //可以使用_省略参数标签
}
someFunction(1, secondParameterName: 2)
//如果标签被忽略掉，则调用时不能指定
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    print(parameterWithDefault)
}
someFunction(parameterWithoutDefault: 4)
//定义默认参数
func arithmeticMean(_ numbers: Double...) -> Double {
    //...
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
//使用可变参数，一个函数最多有一个可变参数
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
//关键字inout用来申明参数为输入输出参数，不能有默认值，可变参数不能标记为inout
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
anotherInt
//在调用时使用&标号表示参数可以修改，感觉这样的的设计不好
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}
var mathFunction: (Int, Int) -> Int = addTwoInts
mathFunction(2,3)
//上面这个语句相当于定义了一个函数类型的变量，并且对应的函数是addTwoInts，之后可以直接通过这个变量去调用
mathFunction = multiplyTwoInts
mathFunction(2,3)
//可以更新对应的函数
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)
//参数变量也可以作为函数类型，这个挺有意思的，和php的闭包有点像
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}
var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
moveNearerToZero(currentValue)
/*
 上面的代码块实现了一个把某个数逐渐变为0的过程
 chooseStepFunction方法返回的是一个函数类型
 */
func chooseStepFunction1(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue1 = -4
let moveNearerToZero1 = chooseStepFunction(backward: currentValue > 0)
//上面的代码和之前的等价，但这段方法使用的是嵌套函数








