//
//  main.swift
//  8958_OX퀴즈
//
//  Created by user on 2022/06/26.
//

let T = Int(readLine()!)!

for _ in 1...T {
    let input = readLine()!.split(separator:"X").map{String($0)}
    var score = 0
    
    for os in input {
        score += (os.count * (os.count + 1)) / 2
    }
    
    print(score)
}
