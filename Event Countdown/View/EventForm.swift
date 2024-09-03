//
//  EventForm.swift
//  Event Countdown
//
//  Created by Shahad Bagarish on 27/08/2024.
//

import SwiftUI

struct EventForm: View {
    @Binding var event: Event
    @Binding var viewTitle: String
    
    var body: some View {
        Form{
            TextField(text: $event.title) {
                Text("Title")
            }
            .foregroundStyle(Color(event.textColor))
            
            DatePicker(
                "Date",
                selection: $event.date,
                displayedComponents: [.date]
            )
            ColorPicker("Text Color", selection: $event.textColor)
        }
        
    }
    

}
