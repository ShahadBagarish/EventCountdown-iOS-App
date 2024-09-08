//
//  EventRow.swift
//  Event Countdown
//
//  Created by Shahad Bagarish on 27/08/2024.
//

import SwiftUI

struct EventRow: View {
    var event: Event
    @State private var countDown = ""
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Text(event.title)
                .foregroundStyle(event.textColor)
                .font(.title)
                .bold()
            Text(countDown)
                .foregroundStyle(event.date < Date.now ? .red : .black)
                .onReceive(timer) { now in countDownString(from: event.date, to: now, update: &countDown) }
        })
        
    }
}

func countDownString (from date: Date, to now: Date, update countDown: inout String) {
    countDown = RelativeDateTimeFormatter().localizedString(for: date, relativeTo: now)
}
