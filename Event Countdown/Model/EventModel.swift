//
//  EventModel.swift
//  Event Countdown
//
//  Created by Shahad Bagarish on 28/08/2024.
//

import Foundation
import SwiftUI

struct Event: Identifiable, Comparable, Hashable {
    
    var id = UUID()
    var title: String
    var date = Date()
    var textColor: Color
    
    init() {
        id = UUID()
        title = ""
        date = Date.now
        textColor = .black
    }
    
    init(id: UUID, title: String, date: Date, textColor: Color) {
            self.id = id
            self.title = title
            self.date = date
            self.textColor = textColor
        }
    
    static func < (lhs: Event, rhs: Event) -> Bool {
        return lhs.date < rhs.date
    }
    
    static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.id == rhs.id && lhs.title == rhs.title
    }
    
}

enum Mode {
    case add
    case update(Event)
}
