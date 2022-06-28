//
//  main.swift
//  4673_셀프 넘버
//
//  Created by user on 2022/06/26.
//

// d(n) 은 n + n의 각 자리 수

func d(_ n: Int) -> Int {
    var returnNum = n
    var originalNum = n
    
    while originalNum > 9 {
        returnNum += originalNum % 10
        originalNum /= 10
    }
    returnNum += originalNum
    
    
    return returnNum
}


// n 은 d(n) 의 생성자
// 생성자가 없는 숫자가 셀프 넘버

var boolArr = Array<Bool>(repeating: false, count: 10000)

for i in 1..<10000 {
    var num = i
    if boolArr[i] == false {
        while num < 10000 {
            num = d(num)
            if num < 10000 {
                boolArr[num] = true
            }
        }
    }
}

for i in 1..<10000 {
    if !boolArr[i] {
        print(i)
    }
}
