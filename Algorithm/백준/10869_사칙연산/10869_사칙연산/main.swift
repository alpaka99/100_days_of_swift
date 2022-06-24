//
//  main.swift
//  10869_사칙연산
//
//  Created by user on 2022/06/24.
//

let input = readLine()!.split(separator: " ").map{Int(String($0))!}

let A = input[0]
let B = input[1]

print(A + B)
print(A - B)
print(A * B)
print(A / B)
print(A % B)
