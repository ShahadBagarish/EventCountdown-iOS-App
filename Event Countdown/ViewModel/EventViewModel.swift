//
//  observables.swift
//  Event Countdown
//
//  Created by Shahad Bagarish on 03/09/2024.
//

import Foundation
import Observation
import SwiftUI

class EventViewModel: ObservableObject {

    @StateObject var fileCache = FileSystemCache()
    @Published var events: [Event] = [] {
           didSet {
               guard fileCache.loadFromFile() != nil else {
                   return
               }
           }
       }
    
    func saveEvent(_ event: Event) {
        if let index = events.firstIndex(where: { $0.id == event.id }) {
            events[index] = event
        } else {
            events.append(event)
        }
        fileCache.saveToFile(events: events)
    }
    
    func deleteEvent(_ event: Event) {
        self.events = events.filter { $0 != event }
//        events.remove(atOffsets: offsets)
        fileCache.saveToFile(events: self.events)
    }
    
    func updateAndSort(event: Event, events: inout [Event]) {
        if let index = events.firstIndex(where: { $0.id == event.id }) {
            events[index] = event
            print("Update result \(events[index].title)")
            fileCache.saveToFile(events: events)
        } else {
            print("New event added to the list")
            print("DEBUG: \(event)")
            events.append(event)
            fileCache.saveToFile(events: events)

//                fileCache.save(events: events)
        }
        events.sort{ $0 < $1 }
    }
    
  
}

 
