//
//  EventsView.swift
//  Event Countdown
//
//  Created by Shahad Bagarish on 27/08/2024.
//

import SwiftUI

struct EventsView: View {
    
    //Variable Pool
    @State var events: [Event]
//    var mode: Mode
//    var viewTitle: String
//    
    
    //Fuction Pool
    private func delete(at offsets: IndexSet) {
        self.events.remove(atOffsets: offsets)
        print(events)
    }
    private func addEvent() {
        let newEvent = Event(title: "New Event", date: Date.now, textColor: Color.black)
        events.append(newEvent)
    }
    
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(events, id: \.self) { event in
                    NavigationLink(value: event) {
                        EventRow(event: event)
                    }
                    .navigationDestination(for: Event.self) {
                        event in EventForm(event: event)
                    }
                }
                .onDelete(perform: delete)
                //                            .onAppear {
                //                                switch mode {
                //                                case .edit(let event):
                //                                    id = event.id
                //                                    viewTitle = "Edit \(event.title)"
                //                                case .add:
                //                                    viewTitle = "Add Event"
                //                                }
            }
            
                        .navigationBarItems(trailing: Button(action: addEvent) {
                            Image(systemName: "plus")
                                .foregroundStyle(.black)
                        })
//            NavigationLink(destination: {
////                EventForm(event: events)
//            }, label: {
//                Image(systemName: "plus")
//                    .foregroundStyle(.black)
//            })
            .navigationTitle(Text("Events"))
        }
    }

}

#Preview {
    EventsView(events: [
        Event(title: "Halloween", date: Date.now, textColor: Color.yellow),
        Event(title: "Test", date: Date.now, textColor: Color.red),
        Event(title: "tra", date: Date.now, textColor: Color.blue)
    ])
}
