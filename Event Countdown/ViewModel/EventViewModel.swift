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
}
 
