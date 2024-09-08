//
//  DataPersistence.swift
//  Event Countdown
//
//  Created by Shahad Bagarish on 05/09/2024.
//

import Foundation

protocol Cache {
    func save(events: [Event]) -> Bool
    func load() -> [Event]?
}


class FileSystemCache: Cache, ObservableObject {
    
    let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!.appendingPathComponent("userEvents.json")
    
    var readingData: [Event] = []
    
    
    func save(events: [Event]) -> Bool {
        print(self.path)
        readingData = events
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(readingData)
            try jsonData.write(to: self.path)
            return true
        } catch {
            print("Error encoding data: \(error)")
            return false
        }
    }
    
    func load() -> [Event]? {
        
        do {
            let jsonData = try Data(contentsOf: self.path)
            
            let jsonDecoder = JSONDecoder()
            _ = try jsonDecoder.decode([Event].self, from: jsonData)
            
        } catch {
            print("Error decoding data: \(error)")
        }
        return readingData
    }
    
    
}

class InMemoryCache: Cache, ObservableObject {
    
    var savedData: [Event]?
    
    func save(events: [Event]) -> Bool {
        savedData = events
        return true
    }
    
    func load() -> [Event]? {
        return savedData
    }
    
    
}
