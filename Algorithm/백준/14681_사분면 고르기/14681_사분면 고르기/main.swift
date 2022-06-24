//
//  main.swift
//  14681_사분면 고르기
//
//  Created by user on 2022/06/24.
//

let x = Int(readLine()!)!
let y = Int(readLine()!)!


if x > 0 {
    if y > 0 {
        print(1)
    } else {
        print(4)
    }
} else {
    if y > 0 {
        print(2)
    } else {
        print(3)
    }
}
