//
//  main.swift
//  10952_A+B-5
//
//  Created by user on 2022/06/25.
//

while true {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    let A = input[0]
    let B = input[1]
        
    if A == 0 && B == 0 {
        break
    }
    
    print(A+B)
}

