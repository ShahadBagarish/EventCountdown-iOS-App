//
//  DataPersistence.swift
//  Event Countdown
//
//  Created by Shahad Bagarish on 05/09/2024.
//

import Foundation

protocol Cache {
    func saveToFile(events: [Event])
    func loadFromFile() -> [Event]?
}


class FileSystemCache: Cache , ObservableObject{
    
    private let fileManager = FileManager.default
    private let fileName = "events.json"
    private let path: URL
    
    init() {
        self.path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!.appendingPathComponent("userEvents.json")
    }
    
    func saveToFile(events: [Event]) {
        
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(events)
            try jsonData.write(to: self.path)
            print("Data saved in \(self.path.absoluteString)")
        } catch {
            print("Error encoding data: \(error)")
        }
    }
    
    func loadFromFile() -> [Event]? {
        do {
            print(path)
            let jsonData = try Data(contentsOf: self.path)
            
            let jsonDecoder = JSONDecoder()
            let decodedEvents = try jsonDecoder.decode([Event].self, from: jsonData)
            print("Decoded Todo: \(decodedEvents)")
            return decodedEvents
        } catch {
            print("Error load data: \(error)")
            return nil
        }
    }
    
    
}

class InMemoryCache: Cache, ObservableObject {
    
    var savedData: [Event]?
    
    func saveToFile(events: [Event]) {
        savedData = events
    }
    
    func loadFromFile() -> [Event]? {
        return savedData
    }
    
    
}





    


