//
//  main.swift
//  [220524]_swift_day01
//
//  Created by user on 2022/05/24.
//

// 기본 변수 할당
var str = "hello, Swift"
str = "goodBye, \nPython"
var char = "V"

// 여러가지 변수 type 들
var age = 27
print(age)
print(str)
print(char)

// string 에서의 여러줄 사용
var str1 = """
This goes
over multiline
with line-breakers
"""

print(str1)

var str2 = """
This doesn't go \
over multiline \
with line-breakers
"""
print(str2)


// 다른 basic type 들
var pi = 3.141

var awsome = true


// string interpolation
var str3 = "pi is approximated to \(pi) is \(awsome)"

print(str3)


// using constant keyword let
let taylor = "swift"
//taylor = "Swept"
print(taylor)

// type annotations

let str4 = "Hello, Xcode"
let album: String = "Reputation"
let year: Int = 1989
let height: Double = 1.78
let taylorRocks: Bool = true
