//
//  FloatingButton.swift
//  NotesSUI
//
//  Created by Михаил Железовский on 23.12.2022.
//

import SwiftUI

struct FloatingButton: View {
    @EnvironmentObject var dateHolder: DateHolder
    var body: some View {
        Spacer()
        HStack {
            NavigationLink(destination: NotesEditView(passedNoteItem: nil, initialDate: Date())
                .environmentObject(dateHolder)) {
                Text("+ New Note")
                    .font(.headline)
            }
            .padding(15)
            .foregroundColor(.white)
            .background(Color.accentColor)
            .cornerRadius(30)
            .padding(30)
            .shadow(color: .black.opacity(0.3), radius: 3, x: 3, y: 3)
        }
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton()
    }
}
