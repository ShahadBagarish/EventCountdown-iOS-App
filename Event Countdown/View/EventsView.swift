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
    
    //Fuction Pool
 
    private func updateAndSort(event: Event, events: inout [Event]) {
        if let index = events.firstIndex(where: { $0.id == event.id }) {
            events[index] = event
            print("Update result \(events[index].title)")
        } else {
            print("New event added to the list")
            events.append(event)
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
                    List(events.indices, id: \.self) { idx in NavigationLink(value: events[idx]) {
                            EventRow(event: events[idx])
                                .swipeActions {
                                    Button("Delete") {
                                        events.remove(at: idx)
                                        fileCache.save(events: events)
                                    }
                                    .tint(.red)
                                }
                                .onTapGesture {
                                }
                        }
                        .navigationTitle("Event")
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
//        NavigationStack{
//            List {
//                ForEach(events, id: \.self) { event in
//                    NavigationLink(value: event) {
//                        EventRow(event: event)
//                    }
//                    .navigationDestination(for: Event.self) {
//                        event in  EventForm(mode: .add, onSave: {event in updateAndSort(event: event, events: &events)})
//                    }
//                    .swipeActions {
//                        Button(role: .destructive) {
////                            events.delete(id: event.id)
//                        } label: {
//                            Label("Delete" , systemImage: "trash")
//                        }
//                        
//                    }.foregroundStyle(.black)
//                }
//            }
//            .navigationTitle(Text("Events"))
//            .toolbar{
//                ToolbarItem{
//                    //                    NavigationLink {
//                    //                        EventForm()
//                    ////                        EventRow(mode: .add, onSave: { event in updateEventsAndSortBaseOnDate(event: event, events: &events)})
//                    //                    }
//                    NavigationLink {
//                        EventForm(mode: .add, onSave: {event in updateAndSort(event: event, events: &events)})
////                        EventForm(events: events)
//                    } label: {
//                    Image(systemName: "plus")
//                        .foregroundStyle(.black)
//                }
//                    
//                }
//            }
//        }
    }
    
}
