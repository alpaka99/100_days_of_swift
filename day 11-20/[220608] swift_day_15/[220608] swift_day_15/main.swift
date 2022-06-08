//
//  main.swift
//  [220608] swift_day_15
//
//  Created by user on 2022/06/08.
//

//import UIKit

// observer
struct Person {
    var clothes: String {
        willSet {
            updateUI(msg: "I'm changing from \(clothes) to \(newValue)")
        }
        
        didSet {
            updateUI(msg: "I just changed from \(oldValue) to \(clothes)")
        }
    }
}

func updateUI(msg: String){
    print(msg)
}

var taylor = Person(clothes: "T-shirts")
taylor.clothes = "onepiece"


// computed property

struct Person2 {
    var age: Int
    
    var ageInDogYears: Int {
        get {
            return age * 7
        }
    }
}


// static properties and methods
struct TaylorFan {
    static var favoriteSong = "Look What You Made Me Do"
    
    var name: String
    var age: Int
}


let fan = TaylorFan(name: "James", age: 25)
print(TaylorFan.favoriteSong)


// Access control
class TaylorFan2 {
    fileprivate var name: String?
}


// Polymorphism and Typecasting
class Album {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func getPerformance() -> String {
        return "The album \(name) sold lots"
    }
}

class StudioAlbum: Album {
    var studio: String
    
    init(name: String, studio: String) {
        self.studio = studio
        super.init(name: name)
    }
    
    override func getPerformance() -> String {
        return "The studio album \(name) sold lots"
    }
}


class LiveAlbum: Album {
    var location: String
    
    init(name: String, location: String) {
        self.location = location
        super.init(name: name)
    }
    
    override func getPerformance() -> String {
        return "The live album \(name) sold lots"
    }
}

var taylorSwift = StudioAlbum(name: "Taylor Swift", studio: "The Castle Studio")

var fearless = StudioAlbum(name: "Fearless", studio: "Aimeeland Studio")
var iTunesLive = LiveAlbum(name: "iTunes Live from SoHo", location: "New York")
var allAlbums: [Album] = [taylorSwift, fearless, iTunesLive]

for album in allAlbums {
    print(album.getPerformance())
}


// Converting types with Typecasting
//for album in allAlbums {
//    let studioAlbum = album as? StudioAlbum // optional type casting
//}

for album in allAlbums {
    print(album.getPerformance())
    
    if let studioAlbum = album as? StudioAlbum {
        print(studioAlbum.studio)
    } else if let liveAlbum = album as? LiveAlbum {
        print(liveAlbum.location)
    }
}


for album in allAlbums as! [StudioAlbum] {
    print(album.studio)
}

for album in allAlbums as? [LiveAlbum] ?? [LiveAlbum]() {
    print(album.location)
} // 전부 LiveAlbum 인 array 로 변경해보고, 안되면 empty LiveAlbum Array 를 생성해서 아래 작업을 진행 -> 안되면 아무것도 안한다는 뜻


// Closures
//let vw = UIView()
//UIView.animate(withDuration: 0.5, animations: {
//    vw.alpha = 0
//})
