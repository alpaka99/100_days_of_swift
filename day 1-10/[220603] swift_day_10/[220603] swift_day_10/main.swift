//
//  main.swift
//  [220603] swift_day_10
//
//  Created by user on 2022/06/03.
//

// creating your own classes
class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
    
    func makeNoise() {
        print("Woof!")
    }
}

var dog = Dog(name: "Mongja", breed: "Poodle")
print(dog.name, dog.breed)
dog.makeNoise()


// class inheritance
class Maltese: Dog {
    init(name: String) {
        super.init(name: name, breed: "Maltese")
    }
    
    override func makeNoise() {
//        super.makeNoise()
        print("Yip!")
    }
}

var maltese = Maltese(name: "Baekjaerong")



// overriding methods
maltese.makeNoise()


// final classes

// copying objects
class SingerClass {
    var name: String = "Anonymous"
}

var singer = SingerClass()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Justin Bieber"
print(singer.name)


struct SingerStruct {
    var name: String = "Anonymous"
}

var singer2 = SingerStruct()
print(singer2.name)

var singer2Copy = singer2
singer2Copy.name = "Justin Bieber"
print(singer2.name)

// deinitializer
class Person {
    var name: String
    
    init(name: String = "John Doe") {
        print("\(name) is alive!")
        self.name = name
    }
    
    func printGreet() {
        print("Hi, I am \(self.name). Nice to meet you!")
    }
    
    deinit {
        print("\(self.name) is no more")
    }
}


for _ in 1...3 {
    let person = Person()
    person.printGreet()
}


// mutablitity

