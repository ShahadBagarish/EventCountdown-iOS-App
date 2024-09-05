//
//  EventForm.swift
//  Event Countdown
//
//  Created by Shahad Bagarish on 27/08/2024.
//

import SwiftUI

struct EventForm: View {
    //    @StateObject var events: EventViewModel
    @State var event: Event
    @State var viewTitle: String = "Edit View"
    //    @State var id: UUID
    //    @Binding var mode: Mode
    //    @State private var id: UUID = UUID()
    //    @State private var title: String = ""
    //    @State private var date: Date = Date()
    //    @State private var textColor: Color = .black
    //    private var formTitle: String = ""
    //    var onSave: (Event) -> Void

    
    //        var onSave: (Event) -> Void
    
    var body: some View {
        print("DEBUG: \(event)")
        
        return VStack{
            Form{
                TextField("Title", text: $event.title)
                    .foregroundStyle(Color(event.textColor))
                DatePicker(
                    "Date",
                    selection: $event.date,
                    displayedComponents: [.date]
                )
                ColorPicker("Text Color", selection: $event.textColor)
            }
        }
        .navigationTitle("\(viewTitle)")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem{
                Button {
                    print("onSave")
                } label: {
                    Image(systemName: "checkmark")
                        .foregroundStyle(.black)
                }
            }
        }
    }
}

