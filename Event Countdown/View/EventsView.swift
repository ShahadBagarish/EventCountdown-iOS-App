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
    @State var events: [Event]
    @State var eventsViewModel = EventViewModel()
    
    @State private var showingForm = false
    @State private var selectedEvent: Event? = nil
    
    
    
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
                            EventForm(formMode: .add) { newEvent in
                                events.append(newEvent)
                                fileCache.saveToFile(events: events)
                            }
                        } label: {
                            Text("Create first event")
                        }
                        .navigationTitle("Event")
                    }
                } else {
                    List {
                        ForEach(events.indices, id: \.self) { idx in
                            NavigationLink(value: events[idx]) {
                                EventRow(event: events[idx])
                                    .swipeActions {
                                        Button("Delete") {
                                            events.remove(at: idx)
                                            fileCache.saveToFile(events: events)
                                        }
                                        .tint(.red)
                                    }
                                    .onTapGesture {
                                    }
                            }
                        }
                        .navigationTitle("Event")
                    }
                    .navigationDestination(for: Event.self) { event in
                        EventForm(formMode: .update) { event in
                            eventsViewModel.updateAndSort(event: event, events: &events)
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .primaryAction){
                            NavigationLink {
                                EventForm(formMode: .add) { event in
                                    eventsViewModel.updateAndSort(event: event, events: &events)
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
