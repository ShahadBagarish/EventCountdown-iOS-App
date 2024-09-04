//
//  EventForm.swift
//  Event Countdown
//
//  Created by Shahad Bagarish on 27/08/2024.
//

import SwiftUI

struct EventForm: View {
    @State var event: Event
    //     var viewTitle: String
    
    var body: some View {
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
    
    
}
