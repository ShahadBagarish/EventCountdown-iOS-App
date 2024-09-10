//
//  EventsView.swift
//  Event Countdown
//
//  Created by Shahad Bagarish on 27/08/2024.
//

import SwiftUI

struct EventsView: View {
    
    //Variable Pool
    
    @EnvironmentObject var eventsViewModel: EventViewModel
//    @State var events: [Event]
    @State private var showingForm = false
    @State private var selectedEvent: Event? = nil
    
    //Fuction Pool
    private func updateAndSort(event: Event, events: inout [Event]) {
        if let index = events.firstIndex(where: { $0.id == event.id }) {
            events[index] = event
            print("Update result \(events[index].title)")
        } else {
            print("New event added to the list")
            print("DEBUG: \(event)")
//            events.append(event)
//                fileCache.save(events: events)
        }
        events.sort{ $0 < $1 }
    }
    
    var body: some View {
        VStack{
            NavigationStack {
                if eventsViewModel.events.isEmpty {
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
                            EventForm(formMode: .add) { newEvent in
                                eventsViewModel.events.append(newEvent)
                            }
                        } label: {
                            Text("Create first event")
                        }
                        .navigationTitle("Event")
                    }
                } else {
                    List {
                        ForEach(eventsViewModel.events.indices, id: \.self) { index in
                            let singleEvent = eventsViewModel.events[index]
                            NavigationLink(value: singleEvent) {
                                EventRow(event: singleEvent)
                                    
                                .swipeActions {
                                    Button {
                                        eventsViewModel.deleteEvent(singleEvent)
//                                        eventsViewModel.deleteEvent(at: index)
//                                        events.saveEvent(event: events[index])
                                    } label: {
                                        Image(systemName: "trash")
                                    }.tint(.red)
                                }
                        }
                           
                        }
//                        .onDelete(perform: { indexSet in
//                            eventsViewModel.deleteEvent(at: indexSet)
//                        })
                        .navigationTitle("Event")
                        .navigationDestination(for: Event.self) { event in
                            EventForm(formMode: .update) { event in
                                updateAndSort(event: event, events: &eventsViewModel.events)
                            }
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .primaryAction){
                            NavigationLink {
                                EventForm(formMode: .add) { event in
                                    updateAndSort(event: event, events: &eventsViewModel.events)
                                }
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
