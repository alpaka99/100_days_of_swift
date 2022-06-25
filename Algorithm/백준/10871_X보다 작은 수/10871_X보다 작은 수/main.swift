//
//  main.swift
//  10871_X보다 작은 수
//
//  Created by user on 2022/06/25.
//

let nx = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = nx[0]
let X = nx[1]

let A = readLine()!.split(separator: " ").map{Int(String($0))!}

var arr = Array<Int>()

for number in A {
    if number < X {
        arr.append(number)
    }
}

let joinedArr = arr.map{String($0)}.joined(separator:" ")
print(joinedArr)




