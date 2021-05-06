//
//  ContentView.swift
//  project 5
//
//  Created by Anisha Lamichhane on 4/22/21.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
//    Challenge 3
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter your word", text: $newWord, onCommit: addNewword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding()
                
                List(usedWords, id: \.self) {
                    Image(systemName: "\($0.count).circle")
                    Text($0)
                }
                
                VStack {
                    Text(" Score: \(score)")
                        .foregroundColor(.orange)
                        .fontWeight(.black)
                   
                }
            }
            .navigationBarTitle(rootWord)
            .onAppear(perform: startGame)
            .alert(isPresented: $showingError) {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
        }
       
    }
}
    
    func addNewword() {
//        lowercase and trim the word, to make sure we don't add duplicate words with case differences
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
      
//        exit if the remaining string is empty
        guard answer.count > 0 else {
            return
        }
        
//        challenge 3
        
//        extra validation to come
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original.")
            score -= 1
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not recogonized", message: "You just can't make them up you know.")
            score -= 1
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not possible", message: "That isn't a real word.")
            score -= 1
            return
        }
        
        usedWords.insert(answer, at: 0)
        newWord = ""
        score += 5
        showingScore = true
    }
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") { //find start.txt in our bundle
            if let startWords = try? String(contentsOf: startWordsURL) { // load the starturl into string
                let allWords = startWords.components(separatedBy: "\n") // lead the startword string as array of string
                rootWord = allWords.randomElement() ?? "SilkWorm"
                return
            }
        }
        fatalError("Could not load start.txt from bundle")
        
    }
    
    func isOriginal(word: String)-> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord.lowercased()
         
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter){
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        let tempWord = rootWord.lowercased()
        //Challenge 1
        if word.count >= 3 && word != tempWord {
            let checker = UITextChecker()
            let range = NSRange(location: 0, length: word.utf16.count)
            let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
            return misspelledRange.location == NSNotFound
        } else {
            print("hello")
            return false
        }
        
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
