//
//  EditPerson.swift
//  SusTracker
//
//  Created by PM Student on 11/11/24.
//

import SwiftUI

struct EditPerson: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var minutes: Double = 0
    
    var person: FetchedResults<SusPerson>.Element
    
    var body: some View {
        Form {
            Section {
                TextField("\(person.name!)", text: $name)
                    .onAppear {
                        name = person.name!
                        minutes = person.minutes
                    }
                VStack {
                    Text("Minutes: \(Int(minutes))")
                    Slider(value: $minutes, in: 0...720, step: 10)
                }
                .padding()
                
                HStack {
                    Spacer()
                    Button("Submit") {
                        DataController().editPerson(person: person, name: name, minutes: minutes, context: managedObjContext)
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    let context = DataController().container.viewContext
    let samplePerson = SusPerson(context: context)
    samplePerson.name = "Dean"
    samplePerson.minutes = 120
    samplePerson.date = Date()
    return EditPerson(person: samplePerson)
        .environment(\.managedObjectContext, context)
}
