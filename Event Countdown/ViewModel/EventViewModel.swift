//
//  observables.swift
//  Event Countdown
//
//  Created by Shahad Bagarish on 03/09/2024.
//

import Foundation
import Observation
import SwiftUI

@Observable class EventViewModel: Identifiable, Hashable{

    var events: [Event] = []
    
    init(events: [Event]) {
        self.events = events
    }
    
    func append(){
        let newEvent = Event(title: "Test", date: Date.now, textColor: Color.red)
        events.append(newEvent)
    }
    
    func remove(id: UUID){
        events = events.filter { $0.id != id }
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: EventViewModel, rhs: EventViewModel) -> Bool {
        return lhs.id == rhs.id
    }
}
 
