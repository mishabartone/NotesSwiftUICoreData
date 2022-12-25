//
//  ContentView.swift
//  NotesSUI
//
//  Created by Михаил Железовский on 23.12.2022.
//

import SwiftUI
import CoreData

struct NotesListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dateHolder: DateHolder

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \NotesItem.created, ascending: true)],
        animation: .default)
    private var items: FetchedResults<NotesItem>

    var body: some View {
        NavigationView {
            VStack{
                ZStack {
                    List {
                        ForEach(items) { notesItem in
                            NavigationLink(destination: NotesEditView(passedNoteItem: notesItem, initialDate: Date())
                                .environmentObject(dateHolder)) {
                                Text(notesItem.name!)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            EditButton()
                        }
                    }
                    FloatingButton()
                        .environmentObject(dateHolder)
                }
            }.navigationTitle("Notes List")
        }
    }

    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            dateHolder.saveContext(viewContext)
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NotesListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
