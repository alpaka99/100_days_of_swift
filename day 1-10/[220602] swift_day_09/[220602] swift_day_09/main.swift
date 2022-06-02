//
//  main.swift
//  [220602] swift_day_09
//
//  Created by user on 2022/06/02.
//

// initializers
struct User {
    var username: String
    
    init() { // initializer
        username = "Anonymous"
        print("Creating a new user!")
    }
}

//var user = User(username: "twostraws")
var user = User()
user.username = "twostraws"


// referring to the current instance
struct Student {
    var name: String
    var bestFriend: String
    
    init(name:String, bestFriend: String){
        print("Enrolling \(name) in a class..")
        self.name = name
        self.bestFriend = bestFriend
    }
}


var student = Student(name: "Tenev", bestFriend: "Landrunner")


// lazy properties
struct FamilyTree {
    init() {
        print("Creating family tree")
    }
}


struct Person {
    var name: String
    lazy var familyTree = FamilyTree() // lazy property
    
    init(name: String) {
        self.name = name
    }
}

var ed = Person(name:"Ed")
let ft = ed.familyTree


// Static properties methods

struct Student2 {
    static var classSize = 0
    var name: String
    
    init(name: String) {
        self.name = name
        Student2.classSize += 1
    }
}

let Ed = Student2(name: "Ed")
let taylor = Student2(name: "Taylor")
print(Student2.classSize)


// Access control
struct Person2 {
    var name: String
    private var id: String
    
    init(name: String, id: String) {
        self.name = name
        self.id = id
    }
    
    func identify() -> String {
        return "\(self.name)'s social security number is \(self.id)"
    }
}


let tenev = Person2(name: "Tenev", id: "12345")
//print(tenev.id)
print(tenev.identify())
