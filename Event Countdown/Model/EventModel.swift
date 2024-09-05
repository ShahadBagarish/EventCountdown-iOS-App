//
//  EventModel.swift
//  Event Countdown
//
//  Created by Shahad Bagarish on 28/08/2024.
//

import Foundation
import SwiftUI


struct Event: Comparable, Identifiable, Hashable{
    
    var id = UUID()
    var title: String
    var date = Date()
    var textColor: Color
    
    init() {
        title = ""
        date = Date.now
        textColor = .black
    }
    
    init(title: String, date: Date, textColor: Color) {
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
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}

enum Mode {
    case add
    case update
}
