//
//  main.swift
//  [220605] swift_day_12
//
//  Created by user on 2022/06/05.
//

// handling missing data
var age: Int? = nil
age = 38

// unwrapping optional
var name: String? = nil

if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}


// unwrapping with guard
func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didin't provide a name")
        return
    }
    
    print("Hello, \(unwrapped)")
}

greet(name)


// force unwrapping
let str = "5"
let num = Int(str)! // swift 입장에서는 str 에 뭐가 들었는지 모르기 때문에 num 이 optional 임


// implicitly unwrapping optionals
let iuo: Int! = nil


// nil coalescing
func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

let user = username(for:15) ?? "Anonymous" // nil coalescing operator


// optional chaining
let names = ["John", "Paul", "Geoarge", "Ringo"]
let beatle = names.first?.uppercased() // .first 는 첫 값이 있으면 값을 반환, 없으면 nil 을 반환 // 값이 있으면 뒤의 uppercased 를 진행, 없으면 바로 beatle = nil 이 됨


// optional try


// failable initializer
struct Person {
    var id: String
    
    init?(id: String) { // failable initializer
        if id.count == 9 {
            self.id = id
        } else {
            return nil // optional person 타입이 리턴됨
        }
    }
}


var person = Person(id: "123456789")
if let unwrappedPerson = person {
    print(unwrappedPerson.id)
} else {
    print("Nil returned")
}


var personNil = Person(id: "12345")
if let unwrappedPerson = personNil {
    print(unwrappedPerson.id)
} else {
    print("Nil returned")
}



// typecasting
class Animal {}
class Fish: Animal {}
class Dog: Animal {
    func makeNoise() {
        print("Woof")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}
