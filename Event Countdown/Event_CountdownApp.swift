//
//  Event_CountdownApp.swift
//  Event Countdown
//
//  Created by Shahad Bagarish on 27/08/2024.
//

import SwiftUI

@main
struct Event_CountdownApp: App {
    @State var events = EventViewModel(events:
                                        [Event(title: "Halloween", date: Date.now, textColor: Color.yellow),
                                         Event(title: "Test", date: Date.now, textColor: Color.red),
                                         Event(title: "tra", date: Date.now, textColor: Color.blue)])
    
    var body: some Scene {
        WindowGroup {
            EventsView()
                .environment(events)
        }
    }
}
