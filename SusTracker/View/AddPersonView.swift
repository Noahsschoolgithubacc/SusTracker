//
//  AddPersonView.swift
//  SusTracker
//
//  Created by PM Student on 11/11/24.
//

import SwiftUI

struct AddPersonView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    // @Envirionment = an object living in the current envirionment, available to read whenever needed. Used for data shared among many views
    // .dismiss = closes the presentation
    
    @State private var name = ""
    @State private var minutes: Double = 0
    
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $name)
                
                VStack {
                    Text("Minutes \(Int(minutes))")
                    Slider(value: $minutes, in: 0...720, step: 10)
                }
                .padding()
                
                HStack {
                    Spacer()
                    Button("Submit") {
                        DataController().addPerson(name: name, minutes: minutes, context: managedObjectContext)
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    AddPersonView()
}
