//
//  TrackEvents.swift
//  TrackerApp
//
//  Created by Craig on 11/19/21.
//

import SwiftUI

struct TrackEvents: View {
    @EnvironmentObject var event: Event
    
    var body: some View {
        //MARK: Bindings
        //creates the binding for the event selector and causes the view to update when the ID of the event is selected
        let trackEventSelector = Binding<String>(
            get: { self.event.trackEventList[event.id] },
            set: {
                self.event.id = self.event.trackEventList.firstIndex(of: $0) ?? 0
                self.event.name = self.event.trackEventList[self.event.id]
            })
        
        //MARK: Track Events
        Picker(selection: trackEventSelector, label: Text("Choose an Event")
                .multilineTextAlignment(.center)) {
            ForEach(event.trackEventList, id : \.self) { item in
                Text(String(item))
            }
        }
    }
}

struct TrackEvents_Previews: PreviewProvider {
    static let event = Event()
    static var previews: some View {
        TrackEvents().environmentObject(event)
    }
}
