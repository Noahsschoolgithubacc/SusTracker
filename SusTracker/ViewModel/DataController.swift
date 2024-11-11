//
//  DataController.swift
//  SusTracker
//
//  Created by PM Student on 11/11/24.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "SusModel")
    // loadpersistent storage = once init you need to exec it with (completion handler) to instruct the contianer to load the persistent stores ?
    
    // prints error message if data fails to load
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data: \(error.localizedDescription)")
                
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        // nsmanagedobjectcontext = used to manupilate and track changes in managed objects
        do {
            try context.save()
            print("Saved")
        } catch {
            print("Failed to save")
        }
    }
    
    // adds new person and saves data
    func addPerson(name: String, minutes: Double, context: NSManagedObjectContext) {
        let person = SusPerson(context: context)
        person.id = UUID()
        person.date = Date()
        person.name = name
        person.minutes = minutes
        
        save(context: context)
    }
    
    // edits an entry and saves the data
    func editPerson(person: SusPerson, name: String, minutes: Double, context: NSManagedObjectContext) {
        person.date = Date()
        person.name = name
        person.minutes = minutes
        
        save(context: context)
    }
}
