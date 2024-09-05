//
//  EventsView.swift
//  Event Countdown
//
//  Created by Shahad Bagarish on 27/08/2024.
//

import SwiftUI

struct EventsView: View {
    
    //Variable Pool
//    @EnvironmentObject var events: EventViewModel
    @EnvironmentObject var events: EventViewModel
    @State var mode: Mode = .update
    
    //    var viewTitle: String
    //
    
    //Fuction Pool
    private func delete(at offsets: IndexSet) {
        events.events.remove(atOffsets: offsets)
        print(events)
    }
    private func addEvent() {
        let newEvent = Event(title: "New Event", date: Date.now, textColor: Color.black)
        events.events.append(newEvent)
    }
    
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
        NavigationStack{
            List {
                ForEach(events.events, id: \.self) { event in
                    NavigationLink(value: event) {
                        EventRow(event: event)
                    }
                    .navigationDestination(for: Event.self) {
                        event in EventForm(event: event)
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            events.delete(id: event.id)
                        } label: {
                            Label("Delete" , systemImage: "trash")
                        }
                        
                    }.foregroundStyle(.black)
                }
            }
            .navigationTitle(Text("Events"))
            .toolbar{
                ToolbarItem{
                    //                    NavigationLink {
                    //                        EventForm()
                    ////                        EventRow(mode: .add, onSave: { event in updateEventsAndSortBaseOnDate(event: event, events: &events)})
                    //                    }
                    NavigationLink {
//                        EventForm(events: events)
                    } label: {
                    Image(systemName: "plus")
                        .foregroundStyle(.black)
                }
                    
                }
            }
        }
    }
    
}
