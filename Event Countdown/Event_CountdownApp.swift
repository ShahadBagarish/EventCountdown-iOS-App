//
//  Event_CountdownApp.swift
//  Event Countdown
//
//  Created by Shahad Bagarish on 27/08/2024.
//

import SwiftUI

@main
struct Event_CountdownApp: App {
    var body: some Scene {
        WindowGroup {
            EventsView(events: [
                Event(title: "Halloween", date: Date.now, textColor: Color.yellow),
                Event(title: "Halloween", date: Date.now, textColor: Color.yellow)])
        }
    }
}
