//
//  ContentView.swift
//  project 5
//
//  Created by Anisha Lamichhane on 4/22/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            //we have found the file
            
            if let fileContents = try? String(contentsOf: fileURL) {
                // we loaded the file into a string
            }
        }
        return Text("helo")
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
