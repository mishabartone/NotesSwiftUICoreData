//
//  NotesEditView.swift
//  NotesSUI
//
//  Created by Михаил Железовский on 23.12.2022.
//

import SwiftUI

struct NotesEditView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dateHolder: DateHolder
    
    @State var selectedNoteItem: NotesItem?
    @State var name: String
    @State var desc: String

    
    init(passedNoteItem: NotesItem?, initialDate: Date){
        if let noteItem = passedNoteItem {
            _selectedNoteItem = State(initialValue: noteItem)
            _name = State(initialValue: noteItem.name ?? "")
            _desc = State(initialValue: noteItem.desc ?? "")

        }
        else {
            _name = State(initialValue: "")
            _desc = State(initialValue: "")
        }
    }
    
    var body: some View {
        Form {
            Section(header: Text("Task")) {
                TextField("Note name", text: $name)
                TextField("Description", text: $desc, axis: .vertical)
                    .lineLimit(5...10)
            }
            Section() {
                Button("Save", action: saveAction)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
    

    func saveAction(){
        withAnimation {
            if selectedNoteItem == nil {
                selectedNoteItem = NotesItem(context: viewContext)
            }
            
            selectedNoteItem?.created = Date()
            selectedNoteItem?.name = name
            selectedNoteItem?.desc = desc
            
            dateHolder.saveContext(viewContext)
            self.presentationMode.wrappedValue.dismiss()
        }
    }
    
    
}

struct NotesEditView_Previews: PreviewProvider {
    static var previews: some View {
        NotesEditView(passedNoteItem: NotesItem(), initialDate: Date())
    }
}
