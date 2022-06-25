//
//  main.swift
//  11021_A+B-7
//
//  Created by user on 2022/06/25.
//

let T = Int(readLine()!)!

for tc in 1...T {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    let A = input[0]
    let B = input[1]
    
    print("Case #\(tc): \(A+B)")
}
