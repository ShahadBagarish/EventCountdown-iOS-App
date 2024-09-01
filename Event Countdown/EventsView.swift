//
//  EventsView.swift
//  Event Countdown
//
//  Created by Shahad Bagarish on 27/08/2024.
//

import SwiftUI

struct EventsView: View {
    @State var events: [Event]
    
    var body: some View {
        NavigationStack{
            
            List(events, id: \.self) { event in
                
                NavigationLink(value: event) {
                    EventRow(event: event)
                }
                .navigationDestination(for: Event.self) {
                    event in EventForm(event: event)
                }
                
                
            }.toolbar(content: {
                NavigationLink {
                    EventForm(event: Event(title: "", textColor: Color.gray))
                } label: {
                    Image(systemName: "plus")
                        .foregroundStyle(.black)
                }
                
            })
        }
    }
}


#Preview {
    EventsView(events: [
        Event(title: "Halloween", date: Date.now, textColor: Color.yellow)])
}
