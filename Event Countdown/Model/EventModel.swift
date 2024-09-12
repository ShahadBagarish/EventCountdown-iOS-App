//
//  EventModel.swift
//  Event Countdown
//
//  Created by Shahad Bagarish on 28/08/2024.
//

import Foundation
import SwiftUI


struct Event: Comparable, Identifiable, Hashable, Codable {
    
    var id: UUID
    var title: String
    var date = Date()
    var textColor: Color
    
    enum codingKeys: String, CodingKey {
        case id
        case title
        case date
        case textColor
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: codingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.date = try container.decode(Date.self, forKey: .date)
        self.textColor = try container.decode(Color.self, forKey: .textColor)
    }
    
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
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}

enum Mode {
    case add
    case update
}
