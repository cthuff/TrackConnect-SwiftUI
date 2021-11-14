//
//  EventPicker.swift
//  TrackerApp
//
//  Created by Craig on 11/5/21.
//

import SwiftUI

struct EventPicker: View {
    @EnvironmentObject var event: Event
    
    var body: some View {
        
        let eventSelector = Binding<String>(
            get: { self.event.eventList[event.id] },
            set: {
                self.event.id = self.event.eventList.firstIndex(of: $0) ?? 0
                self.event.name = self.event.eventList[self.event.id]
            })
        
            VStack {
                Text("Choose an Event: ")
                Picker(selection: eventSelector, label: Text("Choose an Event")
                        .multilineTextAlignment(.center)) {
                    ForEach(event.eventList, id : \.self) { item in
                        Text(String(item))
                    }
                }
                    .pickerStyle(.wheel)
                    .frame(height: 125, alignment: .center)
                    .clipped()
                ResultInput()
                    .padding(10)
                    .padding(.bottom, UIScreen.main.bounds.height > 0 ? 10 : 100)
                CalculateButton()
        }
    }
}

struct EventPicker_Previews: PreviewProvider {
    static let event = Event()
    
    static var previews: some View {
        EventPicker().environmentObject(event)
    }
}
