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
    @StateObject private var events = EventViewModel()
    
//    @StateObject var events: [Event] = [Event(title: "Halloween", date: Date.now, textColor: .yellow)]
    
//    init() {
//        if let loadedEvents = fileCache.load() {
//            self._events = State(initialValue: loadedEvents)
////            print(fileCache.path)
//        } else {
//            self._events = State(initialValue: [])
//        }
//    }
    
    var body: some Scene {
        WindowGroup {
            EventsView()
                .environmentObject(events)
        }
    }
}
