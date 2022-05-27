//
//  main.swift
//  [220527] swift_day_03
//
//  Created by user on 2022/05/27.
//

// arithmetic operators
let firstScore = 13
let secondScore = 4

let total = firstScore + secondScore
let difference = firstScore - secondScore

let product = firstScore * secondScore
let divided = firstScore / secondScore

let remainder = 13 % secondScore

//operator overloading
let number = 42
let doubleNumber = 42 + 42

let fakers = "Fakers gonna "
let action = fakers + "fake"
print(action)

let firstHalf = ["Jin", "Suga", "RM", "JHope"]
let secondHalf = ["V", "Jimin", "JK"]
let bts = firstHalf + secondHalf
print(bts)

let jungsoo = 4
let silsoo = 4.4
//let number = silsoo + jungsoo
//print(number)

let moonja = "V"
let sootja = 10
//let str = moonja + sootja
//print(str)

// compound assignment operator
var score = 95
score -= 5

var faker = "Fakers gonna "
faker += "fake"

// comparison operator
print(1 == 2)
print(1 != 2)

print(1 > 2)
print(1 <= 2)

print("taylor" >= "swift")

// conditions
let firstCard = 11
let secondCard = 10

if (firstCard + secondCard == 2) {
    print("Aces A Lucky!!")
} else if (firstCard + secondCard == 21){
    print("Blackjack!")
} else {
    print("Regular Cards")
}

// combining conditions
let age1 = 18
let age2 = 17

if age1 >= 18 && age2 >= 18 {
    print("Both are over 18")
}

if age1 >= 18 || age2 >= 18 {
    print("At least one is over 18")
}

// tenary operators
let firstValue = 10
let secondValue = 5

print(firstValue == secondValue ? "Values are same" : "Values are different")


// switch statement
let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear shadestunner")
default:
    print("Happy Sonnyday!")
}

// range operators
let testScore = 85

switch score{
case 0..<50:
    print("You failed badly")
case 50..<85:
    print("You did OK")
default:
    print("You did great!")
}

print(3+1.0)
print(3 / 2.0)
