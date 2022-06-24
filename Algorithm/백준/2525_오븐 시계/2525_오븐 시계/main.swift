//
//  main.swift
//  2525_오븐 시계
//
//  Created by user on 2022/06/24.
//

let curTime = readLine()!.split(separator: " ").map{Int(String($0))!}
let additionalTime = Int(readLine()!)!

var H = curTime[0]
var M = curTime[1]

M += additionalTime

if M >= 60 {
    H += (M / 60)
    M %= 60
}

if H >= 24 {
    H -= 24
}

print(H, M)

