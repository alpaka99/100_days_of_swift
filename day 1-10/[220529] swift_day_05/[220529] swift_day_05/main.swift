//
//  main.swift
//  [220529] swift_day_05
//
//  Created by user on 2022/05/29.
//


// wiriting functions
func printHelp() {
    let message = """
Welcome to MyApp!

Run this app inside a directory of images and
MyApp will resize them all into thumbnails
"""
    
    print(message)
}


printHelp()


// accepting parameters

print("Hello world!")

func square(number: Int) {
    print(number * number)
}

square(number: 8)


// returning values + returning multiple values

func square2(number:Int) -> (length: Int, size: Int) {
    return (number, number*number)
}

let result = square2(number:5)
print(result)


// paremater labels
func sayHello(to name: String){
    print("Hello, \(name)!")
}

sayHello(to: "taylor")


// omitting parameter labels
func greet(_ person: String){
    print("Hello again, \(person)")
}

greet("Swift")

// default parameters
func defaultParameterTest(number:Int = 1)-> Int{
    return number * number
}

print(defaultParameterTest(number:5))
print(defaultParameterTest())


// variadic function
print("Players", "gonna", "play")
print("Haters", "gonna", "hate")


func variadicTest(numbers: Int...){
    for number in numbers{
        print(number)
    }
}

variadicTest(numbers: 1, 2, 3, 4, 5)

// writing throwing functions
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool{
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}


do{
    try checkPassword("password")
    print("Password is good")
} catch {
    print("You can't use that password")
}

// inout parameters

func doubleInPlace(number: inout Int){
    number *= 2
}

var original = 2

doubleInPlace(number: &original)

print(original)
