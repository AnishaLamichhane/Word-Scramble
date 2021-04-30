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
            }
            .navigationBarTitle(rootWord)
            .onAppear(perform: startGame)
        }
       
    }
    
    func addNewword() {
//        lowercase and trim the word, to make sure we don't add duplicate words with case differences
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
      
//        exit if the remaining string is empty
        guard answer.count > 0 else {
            return
        }
        
//        extra validation to come
        usedWords.insert(answer, at: 0)
        newWord = ""
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
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
