//
//  ContentView.swift
//  [220707] swift_day_31
//
//  Created by user on 2022/07/07.
//

import SwiftUI

struct ContentView: View {
    @State private var userInput = ""
    @State private var inputList = [String]()
    @State private var rootWord = ""
    
    var body: some View {
        NavigationView {
            List {
                Section("Root word") {
                    Text(rootWord)
                        .font(.headline)
                }
                
                Section("Type in answer") {
                    TextField("Type in you answer", text: $userInput)
                }
                .onSubmit(addInputList)
                .autocapitalization(.none)
                
                Section("Show your answers") {
                    ForEach(inputList, id: \.self) { input in
                        Text("\(input)")
                    }
                }
            }
            .navigationTitle("What you looking at")
            .onAppear(perform: getRootWord)
        }
    }
    
    func getRootWord() {
        // 1. find URL for start.txt
        if let fileURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // 2. load start.txt into string
            if let wordList = try? String(contentsOf: fileURL) {
                // 3. separate string into array
                let allWords =  wordList.components(separatedBy: "\n")
                
                // 4. choose a word from wordList(nil coalescing)
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        
        // 5. if can't load file or something wrong happen during processing
        fatalError()
    }
    
    func addInputList() {
        // 우선은 userInput 을 정제하는 작업 해야함
        let answer = userInput
        
        inputList.insert(answer, at: 0)
        userInput = ""
    }
    
    
    
    func originalCheck(word: String) -> Bool {
        !inputList.contains(word)
    }
    
    func possibleCheck(word: String) -> Bool {
        var temp = rootWord
        for letter in word {
            // 1. firstIndex(of: ) 로 해당 글자가 가장 처음 나오는 위치 찾기
            if let pos = temp.firstIndex(of: letter) {
                // 2. 해당 위치의 글자를 삭제
                temp.remove(at: pos)
            } else {
                // 3. 만약 못찾았으면 글자가 이미 지워졌거나 애초에 없던것이므로 false 반환
                return false
            }
        }
        // 4. 모든 글자에 대해서 for 문을 도는것을 성공했으면 true 반환
        return true
    }
    
    func checkSpelling(word: String) -> Bool {
        // 1. check 객체 생성
        let checker = UITextChecker()
        // 2. NSRange 로 검사할 범위 설정
        let range = NSRange(location: 0, length: word.count)
        // 3. checker.rangeOfMisspelledWord() 를 통해 오타의 범위를 도출
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        // 4. range 의 location 이 NSNotFound 와 같은지 다른지 판단하여 오타가 있는지 없는지 검증
        return misspelledRange.location == NSNotFound
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
