//
//  main.swift
//  1065_한수
//
//  Created by user on 2022/06/26.
//

// 양의 정수 x 의 각 자리가 등차수열 -> 한수

func hansu(_ n: Int) -> Bool {
    if (n < 10) {
        return true
    }
    
    var arr = Array<Int>()
    
    var num = n
    while num > 9 {
        arr.append(num % 10)
        num /= 10
    }
    arr.append(num)
    
    let diff = arr[0] - arr[1]
    
    for i in 0..<arr.count-1 {
        if arr[i] - arr[i+1] != diff {
            return false
        }
    }
    
    return true
}





let input = Int(readLine()!)!

var cnt = 0

for i in 1...input {
    if hansu(i) {
        cnt += 1
    }
}

print(cnt)

