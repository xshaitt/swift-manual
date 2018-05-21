//关于字符串的操作
let someString = "Some string literal value"
//定义一个字符串，使用""双绰号不支持'单引号
let quotation = """
定义多行文件可以使用三个双引号

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""
//上面的两个字符串是等价的，因为多行字符串从第一个"""后的一行开始，到第二个"""前的一行结束
let threeDoubleQuotationMarks = """
Escaping the first quotation mark \"""
Escaping all three quotation marks \"\"\"
"""
//如果需要在多行字符串当中使用"需要转义
var emptyString = ""               // 分配空字符串
var anotherEmptyString = String()  // 使用String初始化一个空的实例
//上面两个语句都是创建了空字符串，是等价的
if emptyString.isEmpty{
    print("String都有isEmpty属性，判断字符串是否为空")
}
for character in "Dog!🐶" {
    print(character)
}
//String的单个字符是Character类型
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
//单字符和字符串还可以这种组合操作
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
let exclamationMark: Character = "!"
welcome.append(exclamationMark)
//String之间可以直接连接操作，但单字符必须使用append方法
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
//往字符串里插值的方式
let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
//虽然看上去不可思议，但也许只是不懂其原理，确实是可以往Character里存unicode的
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("swift的字符统计还是很优秀的兼容中文和unicode\(unusualMenagerie.count)")
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a
//上面的这种访问字符串的单个字符的方式仅看上去就像是用的比较少的样子
for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}
//使用字符串的indices方法也可以访问单个字符
welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
//在最后一个索引处插入!
welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
//在最一个索引之前的位置插入一段字符串

welcome.remove(at: welcome.index(before: welcome.endIndex))
welcome
//删除最后一个字符并返回这个字符
let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
//定义一个区间，把字符串的这个区间内的字符删除，并返回剩下的值

let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"
if eAcuteQuestion == combinedEAcuteQuestion {
    print("这两个扩展字符集虽然内部值不相等，但只要它们的正则等价则swift认为它们相等")
}

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        //判断前缀,hasSuffix是判断后缀
        act1SceneCount += 1
    }
}
print("Act 1前缀有\(act1SceneCount)个")

//不想学习字符串的内部编码，有点枯躁
