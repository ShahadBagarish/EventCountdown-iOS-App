//
//  observables.swift
//  Event Countdown
//
//  Created by Shahad Bagarish on 03/09/2024.
//

import Foundation
 
class EventViewModel: ObservableObject{
    @Published var event: Event
    
    init(event: Event) {
        self.event = event
    }
}
