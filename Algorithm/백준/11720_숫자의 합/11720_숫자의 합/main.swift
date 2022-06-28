//
//  main.swift
//  11720_숫자의 합
//
//  Created by user on 2022/06/26.
//

//let s = "abcdefghijklmn"
//
//print(s[s.index(s.startIndex, offsetBy: 0)])
//print(s[s.index(s.startIndex, offsetBy: 0)...s.index(s.startIndex, offsetBy: 4)])

let N = Int(readLine()!)!
let input = String(readLine()!)

var answer = 0
for i in 0..<input.count {
    answer += Int(String(input[input.index(input.startIndex, offsetBy: i)]))!
}

print(answer)
