//
//  main.swift
//  [220531] swift_day_07
//
//  Created by user on 2022/05/31.
//

//  using closure as parameters when they accept parameter
func travel(action:(String)->Void){
    print("I'm getting ready")
    action("London")
    print("I've Arrived")
}


travel{(place:String) in // trailing clousre & parameter for closure
    print("Driving to \(place)")
}


// using closures as parameters when they return values
func travel2(action: (String) -> String) {
    print("Im getting ready")
    let description = action("London")
    print(description)
    print("I've Arrived")
}

travel2{(place:String) -> String in
    return "I am driving to \(place)"
}

// shorthand parameter names
func travel3(action: (String) -> String) {
    print("Im getting ready")
    let description = action("Seoul")
    print(description)
    print("I've Arrived")
}

travel3{
    "I am driving to \($0)"
}

// closures with multiple parameters
func travel4(action:(String, Int) -> String) {
    print("I'm getting ready")
    let description = action("Seoul", 50)
    print(description)
    print("I've arrived")
}

//travel4 {(place:String, speed:Int) -> String in
//    return "I'm going to \(place) at \(speed)km/h"
//}
travel4 {
    return "I'm going to \($0) at \($1)km/h"
}


// returning closure from functions
func travel5 () -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

let result5 = travel5()
result5("Seoul")

// capturing values
func travel6() -> (String) -> Void {
    var counter = 1
    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}


let result6 = travel6()
result6("Seoul")
result6("Seoul")
