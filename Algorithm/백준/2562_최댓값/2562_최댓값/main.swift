//
//  main.swift
//  2562_최댓값
//
//  Created by user on 2022/06/26.
//

var maxNum = 0
var maxIdx = -1

for i in 1...9 {
    let input = Int(readLine()!)!
    
    if input > maxNum {
        maxNum = input
        maxIdx = i
    }
}

print(maxNum)
print(maxIdx)

