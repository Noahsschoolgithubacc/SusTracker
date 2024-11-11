//
//  ContentView.swift
//  SusTracker
//
//  Created by PM Student on 11/11/24.
//

import SwiftUI


// data model file = database within Xcode. Works like SQL
// SQL = structured query language. A commonly used database
// core data = framework that saves, tracks, filters, modifies data in ios apps, not a db, it connects the app to the db

struct ContentView: View {
    var body: some View {
        VStack {
        
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
