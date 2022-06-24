//
//  main.swift
//  2480_주사위 세개
//
//  Created by user on 2022/06/24.
//

let input = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by:>)

var numSet = Set<Int>()

for number in input {
    numSet.insert(number)
}

switch numSet.count {
case 1:
    print(10000 + input[0] * 1000)
case 2:
    print(1000 + input[1] * 100)
default:
    print(input[0] * 100)
}


