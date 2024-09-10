//
//  EventForm.swift
//  Event Countdown
//
//  Created by Shahad Bagarish on 27/08/2024.
//

import SwiftUI

struct EventForm: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var id: UUID = UUID()
    @State private var title: String = ""
    @State private var date: Date = Date()
    @State private var textColor: Color = .black
    
    var event: Event? = nil
    
    var formMode: Mode
    var onSave: (Event) -> Void
    
    init(formMode: Mode, event: Event? = nil, onSave: @escaping (Event) -> Void) {
        
        self.formMode = formMode
        self.onSave = onSave
        self.event = event
        
        if let eventt = event {
            _id = State(initialValue: eventt.id)
            _title = State(initialValue: eventt.title)
            _date = State(initialValue: eventt.date)
            _textColor = State(initialValue: eventt.textColor)
        }
    }
    
    var body: some View {
        print("DEBUG: \(formMode)")
        
        return VStack {
            Form {
                    TextField("Name", text: $title)
                        .foregroundColor(textColor)
                    DatePicker(
                        "Date",
                        selection: $date
                    )
                    ColorPicker("Text color", selection: $textColor)
            }
            .navigationTitle(formMode == .add ? "Add Event" : "Edit Event")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("save", systemImage: "checkmark") {
                        let newEvent = Event(title: title, date: date, textColor: textColor)
                        onSave(newEvent)
                        dismiss()
                    }
                    .fontWeight(.semibold)
                    .disabled(title.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
    }
}

