//
//  ContentView.swift
//  project 5
//
//  Created by Anisha Lamichhane on 4/22/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List{
            Section (header: accentColor(.green)){
                Text("We are rading about list.")
                Text("hello world")
                Text("We are rading about list.")
            }
            
            Section(header: accentColor(.green)) {
                Text("We are rading about list.")
                Text("hello world")
                Text("We are rading about list.")
            }
        }
      
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
