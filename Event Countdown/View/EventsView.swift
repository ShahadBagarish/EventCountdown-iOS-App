//
//  EventsView.swift
//  Event Countdown
//
//  Created by Shahad Bagarish on 27/08/2024.
//

import SwiftUI

struct EventsView: View {
    
    //Variable Pool
    
    @EnvironmentObject var fileCache: FileSystemCache
    @Binding var events: [Event]
    
    //Fuction Pool
    private func updateAndSort(event: Event, events: inout [Event]) {
        if let index = events.firstIndex(where: { $0.id == event.id }) {
            events[index] = event
            print("Update result \(events[index].title)")
        } else {
            print("New event added to the list")
            events.append(event)
            fileCache.save(events: events)
        }
        events.sort{ $0 < $1 }
    }
    
    var body: some View {
        VStack{
            NavigationStack {
                if events.isEmpty {
                    VStack {
                        VStack{
                            Image(systemName: "server.rack")
                                .font(.system(size: 60, weight: .ultraLight))
                                .foregroundStyle(Color.gray.opacity(0.3))
                            Text("No coming events")
                                .foregroundStyle(Color.gray.opacity(0.3))
                        }
                       .padding()
                        NavigationLink {
                            EventForm(mode: .add, onSave: { newEvent in events.append(newEvent)})
                        } label: {
                            Text("Create first event")
                        }
                        .navigationTitle("Event")
                    }
                } else {
                    List(events.indices, id: \.self) { index in NavigationLink(value: events[index]) {
                            EventRow(event: events[index])
                                .swipeActions {
                                    Button("Delete") {
                                        events.remove(at: index)
                                        fileCache.save(events: events)
                                    }
                                    .tint(.red)
                                }
                        }.navigationTitle("Event")
                    }
                    .navigationDestination(for: Event.self) { event in
                        EventForm(mode: .update(event), onSave: {event in updateAndSort(event: event, events: &events)})
                    }
                    .toolbar {
                        ToolbarItem(placement: .primaryAction){
                            NavigationLink {
                                EventForm(mode: .add, onSave: {event in updateAndSort(event: event, events: &events)})
                            } label: {
                                Image(systemName: "plus")
                            }
                        }
                    }
                }
            }
        }
    }
    
}
