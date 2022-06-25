//
//  main.swift
//  2439_별 찍기 2
//
//  Created by user on 2022/06/25.
//

let N = Int(readLine()!)!

for i in 1...N {
    var spaceStr = String(repeating: " ", count: N - i)
    var starStr = String(repeating: "*", count: i)
    
    print(spaceStr + starStr)
}
