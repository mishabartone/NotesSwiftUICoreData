//
//  TaskCell.swift
//  NotesSUI
//
//  Created by Михаил Железовский on 23.12.2022.
//

import SwiftUI

struct TaskCell: View {
    @EnvironmentObject var dateHolder: DateHolder
    @ObservedObject var passedNoteItem: NotesItem
    var body: some View {
        Text(passedNoteItem.name ?? "")
            .padding(.horizontal)
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskCell(passedNoteItem: NotesItem())
    }
}
