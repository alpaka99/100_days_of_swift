//
//  main.swift
//  9498_시험 성적
//
//  Created by user on 2022/06/24.
//

let score = Int(readLine()!)!

switch score {
case 90...100:
    print("A")

case 80...89:
    print("B")

case 70...79:
    print("C")

case 60...69:
    print("D")

default:
    print("F")

}

