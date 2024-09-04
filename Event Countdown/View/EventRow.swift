//
//  EventRow.swift
//  Event Countdown
//
//  Created by Shahad Bagarish on 27/08/2024.
//

import SwiftUI

struct EventRow: View {
    var event: Event
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Text(event.title)
                .foregroundStyle(event.textColor)
                .font(.title)
                .bold()
            Text("10 hours")
        })
        
    }
}

