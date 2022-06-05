//
//  main.swift
//  [220604] swift_day_11
//
//  Created by user on 2022/06/04.
//

// protocols
protocol Identifiable {
    var id: String {get set}
    func identify()
}

struct User: Identifiable {
    var id: String
}

func displayId(thing: Identifiable) {
    print("My Id is \(thing.id)")
}


// protocol inheritance
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation { }

// Extension
extension Int { // adding methods
    func squared() -> Int {
        return self*self
    }
}

let number = 8
print(number.squared())


extension Int { // adding computed property
    var isEven: Bool {
        return self % 2 == 0
    }
}

print(number.isEven)

// protocol extensions
var pythons = ["Jin", "RM", "Suga", "JHope", "V", "Jimin", "Jungkook"]
var beatles = Set(["John", "Paul", "George", "Ringo"])


extension Collection { // collection is a protocol
    func summarize() {
        print("There are \(count) of us :")
        
        
        for name in self {
            print(name)
        }
    }
}

pythons.summarize()
beatles.summarize()

// protocol-oriented programming
extension Identifiable {
    func identify() {
        print("My ID is \(id).")
    }
}

let twostraws = User(id: "twostraws")
twostraws.identify()
