//
//  SusTrackerApp.swift
//  SusTracker
//
//  Created by PM Student on 11/11/24.
//

import SwiftUI

@main
struct SusTrackerApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
