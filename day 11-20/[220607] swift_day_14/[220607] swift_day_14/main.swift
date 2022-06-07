//
//  main.swift
//  [220607] swift_day_14
//
//  Created by user on 2022/06/07.
//

// functions
func favoriteAlbum(_ album: String) {
    print("My favorite is \(album)")
}
favoriteAlbum("Fearless")

func printAlbumRelease(name: String, year: Int) {
    print("\(name) is released in \(year)")
}
printAlbumRelease(name: "Fearless", year: 2008)

func countLetter(in string: String) {
    print("The string \(string) has \(string.count) letters")
}
countLetter(in: "Hello") // swifty code

func albumIsTaylors(name: String) -> Bool {
    switch(name) {
    case "Taylor Swift":
        return true
    case "Fearless":
        return true
    default:
        return false
    }
}

if albumIsTaylors(name: "Taylor Swift") {
    print("That's one of hers!")
} else {
    print("Who made that?")
}

if albumIsTaylors(name: "The White Album") {
    print("That's one of hers!")
} else {
    print("Who made that?")
}

// optionals
func getHatersStatus() -> String { // always returns value that can use
    return "Hate"
}

func getHaterStatus(weather: String) -> String? {
    if weather == "sunny" {
        return nil
    } else {
        return "Hate"
    }
}

var status: String? // optional String
status = getHaterStatus(weather: "rainy")

func takeHaterAction(status: String) {
    if status == "Hate" {
        print("Hating")
    }
}

if let unwrappedStatus = status { // unwrappedStatus contains non-optional string
    takeHaterAction(status: unwrappedStatus)
}

func yearAlbumReleased(name: String) -> Int? {
    if name == "Taylor Swift" { return 2006 }
    if name == "Fearless" { return 2008 }
    return nil
}

var items = ["James", "John", "Sally"]

func position(of string: String, in array: [String]) -> Int? {
    for i in 0..<array.count {
        if string == array[i] {
            return i
        }
    }
    return nil
}

//let jamesPosition = position(of: "James", in: items)
print(position(of: "James", in: items))
print(position(of: "John", in: items))
print(position(of: "Sally", in: items))
print(position(of: "Bob", in: items))


var year = yearAlbumReleased(name: "Taylor Swift")

if let unwrappedYear = year {
//    print("It was released in \(unwrappedYear)")
    print("It was released in \(year!)")
} else {
    print("There was an error")
}


// optional chaining
func albumReleased(year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    default: return nil
    }
}

let album = albumReleased(year: 2006)?.uppercased()
print("The album is \(album)")


let album2 = albumReleased(year: 2006) ?? "unknown"
print("The album2 is \(album2)")


// enumerations

enum WeatherType {
    case sun
    case cloud
    case rain
    case wind(speed: Int)
    case snow
}

func getHaterStatus2(weather: WeatherType) -> String? {
    switch weather {
    case .sun:
        return nil
    case .wind(let speed) where speed < 10: // using enum holding a value
        return "meh"
    case .cloud, .wind:
        return "dislike"
    case .rain, .snow:
        return "hate"
    }
}

getHaterStatus2(weather: .cloud)


// structs
// structs are complex datatypes
struct Person {
    var clothes: String
    var shoes: String
    
    func describe() {
        print("I like wearing \(clothes) and \(shoes)")
    }
}

let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let other = Person(clothes: "short skirts", shoes: "high heels")

var taylorCopy = taylor
taylorCopy.shoes = "Flip flops"
print(taylor)
print(taylorCopy)


// classes
// classes are also complex data types
class Person2 {
    var clothes: String
    var shoes: String
    
    init(clothes: String, shoes: String) {
        self.clothes = clothes
        self.shoes = shoes
    }
}


class Singer {
    var name: String
    var age: Int
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    
    func sing() {
        print("La La La La")
    }
}

var taylor2 = Singer(name: "Taylor", age: 25)
taylor2.sing()


class CountrySinger: Singer {
    override func sing() {
        print("Trucks, Guitars and Liqur")
    }
}

var taylor3 = CountrySinger(name: "Taylor", age: 25)
taylor3.sing()

class HeavyMetalSinger: Singer {
    var noiseLevel: Int
    
    init(name: String, age: Int, noiseLevel: Int) {
        self.noiseLevel = noiseLevel
        super.init(name: name, age: age)
    }
    
    override func sing() {
        print("I am making noise at \(noiseLevel)dB!!!")
    }
}


var taylor4 = HeavyMetalSinger(name: "Taylor", age:25, noiseLevel: 80)
taylor4.sing()
