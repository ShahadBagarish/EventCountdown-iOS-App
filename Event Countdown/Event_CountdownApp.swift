//
//  Event_CountdownApp.swift
//  Event Countdown
//
//  Created by Shahad Bagarish on 27/08/2024.
//

import SwiftUI

@main
struct Event_CountdownApp: App {
    
    @StateObject var fileCache = FileSystemCache()
    @State private var events: [Event] = []

    init() {
        if let loadedEvents = fileCache.loadFromFile() {
            self._events = State(initialValue: loadedEvents)
        } else {
            self._events = State(initialValue: [
                Event(title: "🥳 Birthday", date: .init(), textColor: .red),
                Event(title: "🏝️ Holiday", date: .init(), textColor: .blue)
            ])
        }
    }
    
    var body: some Scene {
        WindowGroup {
            EventsView(events: events)
                .environmentObject(fileCache)
        }
    }
}
