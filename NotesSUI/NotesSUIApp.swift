//
//  NotesSUIApp.swift
//  NotesSUI
//
//  Created by Михаил Железовский on 23.12.2022.
//

import SwiftUI

@main
struct NotesSUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            
            let context = persistenceController.container.viewContext
            let dateHolder = DateHolder(context)
            
            NotesListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(dateHolder)
        }
    }
}
