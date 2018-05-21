let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
//这个参数接收一个闭包，在上面的语句中，闭包通过了函数包传递
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
/*
 这个是直接传递闭包表达式的方式
 1.闭包语句都在{}里面
 2.in后面跟着的是闭包体
 3.参数与返回值的定义与普通函数类似
 */
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
/*
 因为闭包是作为参数传递给排序方法的，所以swift可以推断出闭包的参数类型以及返回值，所以可以使用如止的简写方式
 */
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
//如果闭包体只有一条语句的话，那么return也可以省略，没有歧义，swift可以识别
reversedNames = names.sorted(by: { $0 > $1 } )
/*
 swift提供了速记参数包，它可以直接使用$0,$1,$2命名规则，分别对应第一个参数，第二个参数。。。。。。
 并且从预期的函数类型当中推断参数名称，数量和类型
 所以in也可以省略了
 */
reversedNames = names.sorted(by: >)
/*
 甚至还可以一个符号搞定整个闭包表达式，但这有几个前提
 1.运算符号的类型参数需要与使用它的方法所需要的闭包的类型一致，比如说>需要两个字符串型参数并且返回bool
 2.满足上面的条件，swift会自动推断，但不太建议这么做，不利于理解
 */
reversedNames = names.sorted() { $0 > $1 }
//如果闭包函数比较长的话，那么可以把闭包体写成函数反面
reversedNames = names.sorted { $0 > $1 }
//如果闭包表达式作为函数的唯一参数提供，那么不需要使用()提供参数
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()
//直到跑完了这个demo我才清楚了知道这样做的意义和功能，就是函数返回了函数类型，保存到变量里面，变量可以无限调用，并且嵌套函数里的变量一直保存
let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
incrementByTen()
//就算新增一个对以前的也是不影响的
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()
/*
 如果把一个闭包引用再次分配给一个变量或者常量那么会指向同一个变量引用，互相之间会影响值
 */
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}
let instance = SomeClass()
instance.doSomething()
print(instance.x)
completionHandlers.first?()
print(instance.x)
//逃逸与非逃逸的闭包的区别就是前者是异步调用的，后者是同步调用的，简单的理解吧，对于逃逸闭包要显示的使用@escaping，否则编译失败
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
let customerProvider = { customersInLine.remove(at: 0) }
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))
//所谓的自动闭包应该就是闭包表达式更简洁的一种写法


