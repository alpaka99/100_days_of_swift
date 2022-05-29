//
//  main.swift
//  [220528] swift_day_04
//
//  Created by user on 2022/05/28.
//

// for loop
let numbers = 1...10

for  number in numbers {
    print("Number is \(number)")
}


let albums = ["Dynamite", "Butter", "Permission to Dance", "Universe"]

for album in albums{
    print("\(album) is BTS's album")
}


print("Players gonna ")

for _ in 1...5 {
    print("play")
}


// while loop
var number = 1

while number <= 10{
    print(number)
    number += 1
}

print("Ready Or Not, here I come!")


// repeat loop
var repeatNumber = 1

repeat{
    print(repeatNumber)
    repeatNumber += 1
} while repeatNumber <= 10

print("Ready or Not, here I come!")



// while loop vs repeat loop

while false {
    print("This is false")
}


repeat {
    print("This is false")
} while false


// exiting loops

var countDown = 10

while countDown >= 0{
    print(countDown)
    if countDown == 4{
        print("I'm bored. Just fire it already")
        break
    }
    countDown -= 1
}

print("Blast off!")


// nested loops

outerLoop: for i in 1...10 {
    for j in 1...10 {
        print("\(i) x \(j) = \(i*j)")
        if i*j == 50{
            print("Emergency Exit")
            break outerLoop
        }
    }
}


// exiting multiple loops


// skipping items

for i in 1...10 {
    if i % 2 == 1{
        continue
    }
    print(i)
}


// infinite loop

//while true {
//    print("To infinity and beyond!") // 코드 실행 강제종료 단축키 command + .
//}
