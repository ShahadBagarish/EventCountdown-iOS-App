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

    static func < (lhs: Event, rhs: Event) -> Bool {
        if lhs.id != rhs.id {
                return true
        } else{
            return false
        }
    }
    
    static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.id == rhs.id && lhs.title == rhs.title
    }
    
}
