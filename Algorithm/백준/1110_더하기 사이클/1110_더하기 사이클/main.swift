//
//  main.swift
//  1110_더하기 사이클
//
//  Created by user on 2022/06/25.
//

let originalNum = Int(readLine()!)!
var num = originalNum
var cnt = 1
while true {
    if num < 10 { // 0.
        num *= 10
    }

    // 1. 각 자리 숫자를 더한다
    var addEach = num / 10 + num % 10

    // 2. 주어진 숫자의 가장 오른쪽 자리 숫자와 구한합의 가장 오른쪽 자리 수를 이어 붙이면 새로운 숫자를 만들 수 있다
    var newNum = (num % 10) * 10 + (addEach % 10)
    
    print(newNum)
    if newNum == originalNum {
        break
    } else {
        num = newNum
        cnt += 1
    }
}


print(cnt)
