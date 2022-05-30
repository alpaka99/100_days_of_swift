//
//  main.swift
//  [220530] swift_day_06
//
//  Created by user on 2022/05/30.
//

// closure
let driving = {
    print("I'm driving in my car")
}


driving()


// accepting
let driving2 = {(place:String) in
    print("I am driving to \(place)")
}

driving2("London")


// returning values from a closure
let driving3 = {(place:String)->String in
    return "I'm driving to \(place)"
}

let message = driving3("London")
print(message)


// closure as parameters
func travel(action:() -> Void){
    print("I'm getting ready to go")
    action()
    print("I arrived")
}

travel(action:driving)


func testOuter(test:()->Void){
    print("Test start")
    test()
    print("Test End")
}
func testInner(){
    print("This is test")
}
testOuter(test: testInner)


// Trailing closure syntax
func travel2(action: () -> Void){
    print("I'm getting ready to go")
    action()
    print("I arrived")
}

travel2 {
    print("I'm driving in my car")
}
