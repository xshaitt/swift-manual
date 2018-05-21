/*
 Swift提供了三种主要的集合类型，称为数组，集合和字典，用于存储值的集合。数组是有序的值集合。集合是不重复的无序集合。字典是键值关联的无序集合。
 集合和字典总是清楚它们可以存储的值和键的类型。这意味着您不能错误地将错误类型的值插入到集合中。这也意味着您可以确信您将从集合中检索的值的类型
 在集合不需要改变的所有情况下创建不可变集合是一个好习惯。这样做可以让您更轻松地推理代码
 如果定义的是常量集合，那么其值和大小都将不可变
 */
var someInts = [Int]()
//创建一个空数组
someInts.append(3)
//追回一条元素
someInts = []
//重置为空，因为已经有类型了所以这是可以的
var threeDoubles = Array(repeating: 0, count: 3)
//用初始化器创建数组
var anotherThreeDoubles = Array(repeating: 2, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles
//使用+连接两个数组的前提是类型必须一致
var shoppingList: [String] = ["Eggs", "Milk"]
//也可以以这种数组文本的方式初始化
shoppingList = ["Eggs", "Milk"]
//类型已经确定，现在可以直接赋值
if shoppingList.isEmpty {
    print("数组是空的")
} else {
    print("数组不是空的")
}
shoppingList.append("Flour")
//追加元素
shoppingList += ["Baking Powder"]
//赋值运算符也是可以的
var firstItem = shoppingList[0]
//取一个元素
shoppingList[0] = "Six eggs"
//更改元素的值，如果下标不存在则会报错
shoppingList[1...3] = ["Bananas", "Apples"]
shoppingList
//批量替换数组的元素
shoppingList.insert("Maple Syrup", at: 0)
//插入元素到指定索引
let mapleSyrup = shoppingList.remove(at: 0)
//删除指定索引，返回被删除的元素
let apples = shoppingList.removeLast()
//删除数组的最后一个元素
for item in shoppingList {
    print(item)
}
//迭代整个数组
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}
//如果需要索引及值的话，使用这种方式
var letters = Set<Character>()
//当元素顺序不重要，或者不能重复时，可以使用集合而不是数组，上面创建了一个空集合
letters.insert("a")
letters.insert("a")
letters
//往集合插入元素，插入同样值不会生效
letters = []
//清空元素
//var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
//创建文字集合
var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
//因为swift的类型推断的原因，可以直接这样简写，但既然官网有这样的一个语法，而这样的方式更方便，那我就使用这样的方式呗
print("有\(favoriteGenres.count)个元素")
//获取只读属性元素个数
if let removedGenre = favoriteGenres.remove("xx") {
    print("\(removedGenre)删除了")
} else {
    print("不存在这个元素")
}
if favoriteGenres.contains("Funk") {
    print("包含这个元素")
} else {
    print("不包含这个元素")
}
for genre in favoriteGenres {
    print("\(genre)")
}
//使用for in 迭代
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}
//如果需要顺序的迭代可以使用集合的sorted方法，这个方法是<进行排序的
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
oddDigits.union(evenDigits).sorted()
//并集
oddDigits.intersection(evenDigits).sorted()
// 交集
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
//取不存在指定集合的元素
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
//对称差集，取两个集合都不存在的
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
houseAnimals.isSubset(of: farmAnimals)
//确定一个集合是否都包含在指定集合
farmAnimals.isSuperset(of: houseAnimals)
//确定一个集合是否包含指定集合所有值
farmAnimals.isDisjoint(with: cityAnimals)
//确定两个集合是否没有共同值
var namesOfIntegers = [Int: String]()
//定义空字典
//var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//意思是键值均为字符串
var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//swift也可以推断出来
airports["LHR"] = "London"
//可以使用下标的方式追加元素
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("旧的值是：\(oldValue).")
}
//使用updateValue方法更新会返回可选的旧的值
if let airportName = airports["DUB1111"] {
    print("这个键的值是\(airportName).")
} else {
    print("不存在这个键")
}
//判断键是否存在
airports["APL"] = "Apple International"
airports["APL"] = nil
airports
//删除一个键
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("删除的值是\(removedValue).")
} else {
    print("没有值的话就返回nil")
}
//使用removeValue删除一个键，如果键不存在返回nil，存在返回删除的值
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
//使用for in迭代
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
//迭代所有键名

for airportName in airports.values {
    print("Airport name: \(airportName)")
}
//迭代所有值
let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)
//取字典的一部分作为一个新的字典
















