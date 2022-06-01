//
//  main.swift
//  [220601] swift_day_08
//
//  Created by user on 2022/06/01.
//

// creating your own struct
struct Sports {
    var name:String // stored property
    var isOlympicSport: Bool // stored property
    
    var olympicStatus: String { // computed property
        if isOlympicSport {
            return "\(name) is Olympic Sport"
        } else {
            return "\(name) is not an Olympic Sport"
        }
    }
}

var tennis = Sports(name: "tennis", isOlympicSport: true)

print(tennis.name)

tennis.name = "Wimbledon tennis"


// computed properties
var chessBoxing = Sports(name:"chessBoxing", isOlympicSport: false)

print(chessBoxing.isOlympicSport)


// property observers
struct Progress {
    var task: String
    var amount: Int {
        willSet{
            print("\(task) is now \(amount)% completed(before)")
        }
        didSet { // didSet Observer
            print("\(task) is now \(amount)% completed(after)")
        }
    }
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100


// methods
struct City {
    var population: Int
    func collectTaxes() -> Int {
        return population * 1000
    }
}

let london = City(population: 9_000_000)
print(london.collectTaxes())


// mutating methods
struct Person {
    var name: String
    
    mutating func makeAnonymous() { // mutating method
        name = "Anonymous"
    }
    
    func callName() {
        print("My name is \(name)")
    }
}


var person = Person(name: "Ed")
person.callName()
person.makeAnonymous()
person.callName()



// properties and methods of strings
let string = "Do or do not, there is no try."
print(string.count) // counts the number of letters in string
print(string.hasPrefix("Do")) // checks if string starts with prefix inside ()
print(string.uppercased())
print(string.sorted())


// properties and meothods of arrays

var toys = ["Woody"]
print(toys.count)
toys.append("Buzz")
print(toys.firstIndex(of: "Buzz"))

print(toys.sorted())
print(toys.remove(at: 0))
print(toys)
