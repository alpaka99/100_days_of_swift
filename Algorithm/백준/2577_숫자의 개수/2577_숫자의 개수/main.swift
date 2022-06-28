//
//  main.swift
//  2577_숫자의 개수
//
//  Created by user on 2022/06/26.
//

var num = 1
var numArray = Array<Int>(repeating: 0, count: 10)


for _ in 1...3 {
    num *= Int(readLine()!)!
}

let strNum = String(num)

for letter in strNum {
//    let idx = Int(letter)
//    numArray[idx] += 1
    numArray[letter.wholeNumberValue!] += 1
}


for number in numArray {
    print(number)
}









