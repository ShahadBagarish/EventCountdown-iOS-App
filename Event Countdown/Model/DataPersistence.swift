//
//  DataPersistence.swift
//  Event Countdown
//
//  Created by Shahad Bagarish on 05/09/2024.
//

import Foundation

protocol Cache {
    func save(events: [Event])
    func load() -> [Event]?
}


class FileSystemCache: Cache, ObservableObject {

    private let path: URL
    
    init(){
        
//        self.path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!.appendingPathComponent("userEvents.json")
        self.path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!.appendingPathComponent("userEvents.json")
    }
    
    func save(events: [Event]) {
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(events)
            try jsonData.write(to: self.path)
            print("Data saved in \(self.path.absoluteString)")
        } catch {
            print("Error encoding data: \(error)")
        }
    }
    
    func load() -> [Event]? {
        do {
            let jsonData = try Data(contentsOf: self.path)
            
            let jsonDecoder = JSONDecoder()
            let decodedEvents = try jsonDecoder.decode([Event].self, from: jsonData)
            print("Decoded Todo: \(decodedEvents)")
            return decodedEvents
        } catch {
            print("Error decoding data: \(error)")
            return nil
        }
    }
    
    
}

class InMemoryCache: Cache, ObservableObject {
    
    var savedData: [Event]?
    
    func save(events: [Event]) {
        savedData = events
    }
    
    func load() -> [Event]? {
        return savedData
    }
    
    
}
