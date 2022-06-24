//
//  main.swift
//  2844_알람 시계
//
//  Created by user on 2022/06/24.
//

let input = readLine()!.split(separator: " ").map{Int(String($0))!}

var H = input[0]
var M = input[1]

M -= 45

if M < 0 {
    M = 60 + M
    H -= 1
}

if H < 0 {
    H += 24
}

print(H, M)

