//
//  EventForm.swift
//  Event Countdown
//
//  Created by Shahad Bagarish on 27/08/2024.
//

import SwiftUI

struct EventForm: View {
    
    @State private var id: UUID = UUID()
    @State private var title: String = ""
    @State private var date: Date = Date()
    @State private var textColor: Color = .black
    @State var viewTitle: String = ""
    var onSave: (Event) -> Void
    var mode: Mode
    
    @Environment(\.dismiss) var dismiss
    
    @State private var navigationTitle: String = ""
    
    init(mode: Mode, onSave: @escaping (Event) -> Void) {
        self.mode = mode
        self.onSave = onSave
        
        
        switch mode {
        case .add:
            _id = State(initialValue: UUID())
            _title = State(initialValue: "")
            _date = State(initialValue: .now)
            _textColor = State(initialValue: .black)
            viewTitle = "Add Event"
        case .update(let event):
            _id = State(initialValue: event.id)
            _title = State(initialValue: event.title)
            _date = State(initialValue: event.date)
            _textColor = State(initialValue: event.textColor)
            viewTitle = "Edit \(title)"
        }
    }
    
    var body: some View {
        VStack {
            Form {
                Section("Edit Options") {
                    TextField("Name", text: $title)
                        .foregroundColor(textColor)
                    DatePicker(
                        "Date",
                        selection: $date,
                        displayedComponents: [.date, .hourAndMinute]
                    )
                    ColorPicker("Text color", selection: $textColor)
                }
            }
            .navigationTitle("\(viewTitle)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let updatedEvent = Event(title: title, date: date, textColor: textColor)
                        onSave(updatedEvent)
                        dismiss()
                    }
                    .fontWeight(.semibold)
                    .disabled(title.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
    }
    
    func titleForFormType(_ mode: Mode) -> String {
        switch mode {
        case .add:
            return "Add Event"
        case .update(_):
            return "Edit "
        }
    }
}

