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

    @Published var events: [Event] = []
    
    init(events: [Event]) {
        self.events = events
    }
    
    func add(){
        let newEvent = Event(title: "New", date: Date.now, textColor: Color.red)
        events.append(newEvent)
    }
    
    func delete(id: UUID){
        events = events.filter { $0.id != id }
    }
    
    
}
 
