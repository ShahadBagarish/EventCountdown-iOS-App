//
//  EventsView.swift
//  Event Countdown
//
//  Created by Shahad Bagarish on 27/08/2024.
//

import SwiftUI

struct EventsView: View {
    @State var events: [Event]
//    =
//    [Event(title: "Halloween", date: Date.now, textColor: Color.yellow),
//                                  Event(title: "Test", date: Date.now, textColor: Color.red),
//                                  Event(title: "tra", date: Date.now, textColor: Color.blue)]
    @State var mode: Mode
    @State var viewTitle: String
    
    var body: some View {
        NavigationStack{
            List {
                ForEach($events, id: \.self) { event in
                    NavigationLink {
//                        EventForm(event: event)
                    } label: {
                        EventRow(event: event)
                    }
                    
                    //                    NavigationLink(value: event) {
                    //                        EventRow(event: $event)
                    //                    }
                    //                    .navigationDestination(for: Event.self) {
                    //                        event in EventForm(event: event)
                    //
                    //                    }
                }
                .onDelete(perform: delete)
//                .onAppear {
//                    switch mode {
//                    case .edit(let event):
//                        id = event.id
//                        viewTitle = "Edit \(event.title)"
//                    case .add:
//                        viewTitle = "Add Event"
//                    }
//                }
                
            }.toolbar(content: {
                NavigationLink {
                    EventForm(event: $events[0], viewTitle: <#Binding<String>#>)
                } label: {
                    Image(systemName: "plus")
                        .foregroundStyle(.black)
                }
                
            })
            .navigationTitle(Text("Events"))
        }
    }
    
    func delete(at offsets: IndexSet) {
        events.remove(atOffsets: offsets)
        print(events)
    }
}
