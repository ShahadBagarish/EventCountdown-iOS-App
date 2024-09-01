//
//  EventForm.swift
//  Event Countdown
//
//  Created by Shahad Bagarish on 27/08/2024.
//

import SwiftUI

struct EventForm: View {
    @State var event: Event
    
    var body: some View {
        Form{
            TextField(text: $event.title) {
                Text("Title")
//                    .foregroundStyle($event.textColor)
            }
            DatePicker(
                "Date",
                selection: $event.date,
                displayedComponents: [.date]
            )
            ColorPicker("Text Color", selection: $event.textColor)
        }
    }
}

#Preview {
    EventForm(event: Event(title: "Work", date: Date.now, textColor: Color.yellow))
}
