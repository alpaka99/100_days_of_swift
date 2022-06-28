//
//  main.swift
//  10818_최소,최대
//
//  Created by user on 2022/06/26.
//

let N = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map{Int(String($0))!}

print(numbers.min()!, numbers.max()!)
