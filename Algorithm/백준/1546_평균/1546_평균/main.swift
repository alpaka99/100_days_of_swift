//
//  main.swift
//  1546_평균
//
//  Created by user on 2022/06/26.
//

let N = Int(readLine()!)!
var scores = readLine()!.split(separator: " ").map{Double(String($0))!}


let M = scores.max()!

for i in 0..<scores.count {
    scores[i] = (scores[i] / M) * 100
}

let sum = scores.reduce(0,+)
print(sum / Double(scores.count))
