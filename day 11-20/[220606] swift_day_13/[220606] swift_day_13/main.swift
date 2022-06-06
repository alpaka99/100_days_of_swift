//
//  main.swift
//  [220606] swift_day_13
//
//  Created by user on 2022/06/06.
//


// conolidation day 1


//variables && constants
var name: String // type annotations
name = "Tim McGraw" // create variable
name = "Romeo" // update variable


var age: Int
age = 25


// Double vs Float
var letitude: Double
letitude = 36.166667

var logitude: Float
logitude = -123486.783333

print(letitude, logitude)

// Boolean
var stayOutTooLate: Bool
stayOutTooLate = true

var nothingInBrain: Bool
nothingInBrain = true

var missABeat = false


// operators
var a = 10
a = a + 1
a = a - 1
a = a * a


var da = 1.1
var db = 2.2
var dc = da + db


var name1 = "Tim McGraw"
var name2 = "Romeo"
var both = name1 + " and " + name2


dc > 3
dc >= 3
dc > 4
dc < 4

name == "Tim McGraw"



// string interpolation
print("Your name is \(name)")
print("Your name is " + name)
print("Your name is \(name), your age is \(age), and your letitude is \(letitude)")

print("one plus two is \(1 + 2)")


// arrays
var evenNumbers = [2, 4, 6, 8]
var songs = ["Shake it Off", "You Belong with me", "Back to December"]
var anyArray: [Any] = [false, 1, 2.0, "Three"]

songs[0]
songs[1]
songs[2]

print(type(of:songs))
print(anyArray)

var song: [String] = []
//var song = [String]()
song.append("Shake it Off")

var songs1 = ["Shake it Off", "You Belong With Me", "Love Story"]
var songs2 = ["Today was a Fairytale", "Welcome to New York", "Fifteen"]

var bothArr = songs1 + songs2
bothArr += ["Everything has changed"]


// dictionaries
var person = [
    "first": "Taylor",
    "middle" : "Alison",
    "last" : "Swift",
    "month" : "December",
    "website" : "taylorswift.com"
]

person["middle"]


// conditional statement
var action: String
var person1 = "hater"

if person1 == "hater" {
    action = "hate"
} else if person1 == "player" {
    action = "play"
} else {
    action = "cruise"
}


var action1: String
var stayOutTooLate1 = true
var nothingInBrain1 = true

if stayOutTooLate1 && nothingInBrain {
    action1 = "cruise"
}

if !stayOutTooLate && !nothingInBrain {
    action1 = "cruise"
}


// loops
for i in 1...10 {
    print("\(i) x 10 is \(i * 10)")
}

var str = "Fakers gonna"

for _ in 1...5 {
    str += " fake"
}

print(str)

for song in songs {
    print("My favorite song is \(song)")
}

var people = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]

for i in 0..<people.count {
    print("\(people[i]) gonna \(actions[i])")
}

var counter = 0

while true {
    print("Counter is now \(counter)")
    
    counter += 1
    
    if counter == 6 {
        break
    }
}


// switch case
let liveAlbums = 2

switch(liveAlbums) {
case 0...1:
    print("You're just starting out")
    
case 2...3:
    print("You're rising star")
    
case 4...5:
    print("You're world famouse!")
    
default:
    print("Have you done something new?")
}
