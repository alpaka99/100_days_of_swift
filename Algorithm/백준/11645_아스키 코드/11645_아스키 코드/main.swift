//
//  main.swift
//  11645_아스키 코드
//
//  Created by user on 2022/06/26.
//

print(Int(UnicodeScalar(String(readLine()!))!.value) - Int(UnicodeScalar("A").value))
