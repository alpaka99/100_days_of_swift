//
//  main.swift
//  3052_나머지
//
//  Created by user on 2022/06/26.
//

var numSet = Set<Int>()

for _ in 1...10 {
    let input = Int(readLine()!)!
    numSet.insert(input % 42)
}

print(numSet.count)
