//
//  main.swift
//  2438_별 찍기1
//
//  Created by user on 2022/06/25.
//


let N = Int(readLine()!)!

for i in 1...N {
    let repeatStr = String(repeating: "*", count: i)
    print(repeatStr)
}


//for i in 1...N {
//    var str = ""
//    for _ in 1...i {
//        str += "*"
//    }
//    print(str)
//}
