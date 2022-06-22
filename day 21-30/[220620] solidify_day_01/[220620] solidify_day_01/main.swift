//
//  main.swift
//  [220620] solidify_day_01
//
//  Created by user on 2022/06/21.
//

import Foundation

// 1. How to create and use protocols
protocol Vehicle {
    var name: String { get }
    var currentPassenger: Int { get set }
    func estimateTime(for distance: Int) ->Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    let name = "Car"
    var currentPassenger = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km")
    }
    
    func openSunroof() {
        print("It's a nice day!")
    }
}

struct Bicycle: Vehicle {
    let name = "Bicycle"
    var currentPassenger = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("I'm cycling \(distance)km")
    }
}


func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'wll try a different vehicle")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car()
commute(distance: 100, using: car)

let bike = Bicycle()
commute(distance: 50, using: bike)


// 2. How to user opaque return types
func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber() )


// 3. How to create and use extensions
var quote = "   The truth is rarely pure and never simple   "
quote.trim()
print(quote)

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    mutating func trim() {
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

let lyrics = """
But I kepp cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)


struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
        
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
        
    }
}


let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)

let HP = Book(title: "Harry Potter", pageCount: 1000)


print(lotr, HP)


// 4. How to create and user protocol extensions
extension Collection {
    var isNotEmpty: Bool { // computed Property
        isEmpty == false
    }
}



let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("Guest Count: \(guests.count)")
}

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(self.name)")
    }
}

struct Employee: Person {
    var name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()


// 5. How to get the most from protocol extensions
extension Numeric {
    func squared() -> Self {
        self * self
    }
}

let wholeNumber = 5
print(wholeNumber.squared())


struct User: Comparable {
    let name: String
    
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.name < rhs.name
    }
}



let user1 = User(name: "Link")
let user2 = User(name: "Zelda")

print(user1 == user2)
print(user1 != user2)
print(user1 < user2)
print(user1 <= user2)
print(user1 > user2)
print(user1 >= user2)
