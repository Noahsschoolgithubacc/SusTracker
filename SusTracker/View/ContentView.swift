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
    
    @Environment(\.managedObjectContext) var managedObjContext
    // fetch request = retrieves entities from a core data store
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var person: FetchedResults<SusPerson>
    
    @State private var showingAddView = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("\(Int(totalMinutesToday())) minutes (Today)")
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                List {
                    ForEach(person) { person in
                        
                    }
                }
            }
        }
    }
    
    // calcs the total minutes recorded
    private func totalMinutesToday() -> Double {
        var minutesToday: Double = 0
        for item in person {
            if Calendar.current.isDateInToday(item.date!) {
                minutesToday += item.minutes
            }
        }
        print("Total minutes today: \(minutesToday)")
        return minutesToday
    }
}

#Preview {
    ContentView()
}
