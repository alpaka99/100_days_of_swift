//
//  main.swift
//  [220526]_swift_day_02
//
//  Created by user on 2022/05/26.
//

// array
let jin = "Kim Seokjin"
let suga =  "Min Yunki"
let jHope = "Jung Hoseok"
let rm = "Kim Namjun"
let jimin = "Kim Jimin"
let v = "Kim Taehyung"
let jk = "Jeon Jungguk"

let bts:[String] = [jin, suga, jHope, rm, jimin, v, jk]

//print(bts)
//print(bts[5])
//print(bts[10])


// set
var btsSet = Set([jin, suga, jHope, rm, jimin, v, jk])
print("first set: \(btsSet)")

btsSet = Set([jin, suga, jHope, rm, jimin, v, jk])
print("second set: \(btsSet)")

let duplicatedSet = Set([jin, suga, jHope, jHope, jHope])
print(duplicatedSet)


// tuple
var name = (first: "Taylor", last:"Swift")
//
//print(name.0)
//print(name.last)

name.0 = "Hello"
print(name.0) // Hello


// dictionary
var heights = [
    "Taylor Swift":1.78,
    "Ed Sheeren": 1.73
]


// warning 의 이유 https://stevenpcurtis.medium.com/expression-implicitly-coerced-from-string-to-any-why-swift-why-190dd0a58c58
print(heights["Taylor Swift"])

heights["Ed Sheeren"] = 1.80
print(heights["Ed Sheeren"])

let favoriteIcecream = [
    "Michael": "Chocolate",
    "LeBron": "Strawberry",
    "Stephen": "Vanilla"
]

print(favoriteIcecream["DeRozan"])
print(favoriteIcecream["DeRozan", default:"Caramel"])
print(favoriteIcecream)


// 빈 collection 만들기
var emptyArray = [Int]()
print("Empty Array: \(emptyArray)")
var emptyArray2 = Array<Int>()


var emptyDictionary = [String: String]()
print("Empty Dictionary: \(emptyDictionary)")
emptyDictionary["key 1"] = "value 1"
var emptyDictionary2 = Dictionary<String, String>()
emptyDictionary["key 2"] = "value 2"


var emptySet = Set<String>()
print("emptySet: \(emptySet)")


// enumeration
let player1 = "top"
let player2 = "topp"
let player3 = "x"
let player4 = "ㅌ"

enum position {
    case top, jug, mid, adc, sup
}

//let player4 = position.topp

//let player5 = position.top

// enum associated value
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity.talking(topic: "football")
print(talking)

// enum rawValue
enum Planet: Int {
    case mercury = 0
    case venus
    case earth
    case mars
}

//let earth = Planet(rawValue: 2)
print(Planet.earth.rawValue)

