//
//  EventPicker.swift
//  TrackerApp
//
//  Created by Craig on 11/5/21.
//

import SwiftUI

struct EventPicker: View {
    @EnvironmentObject var event: Event
    
    @State private var trackOrField = 0
    
    var body: some View {
        
        //creates the binding for the event selector and causes the view to update when the ID of the event is selected
        let eventSelector = Binding<String>(
            get: {
//                self.event.eventList[event.id] ?
                trackOrField == 0 ? self.event.trackEventList[event.id] : self.event.fieldEventList[event.id]
            },
            set: {
                //Track Events
                if( trackOrField == 0){
                    self.event.id = self.event.trackEventList.firstIndex(of: $0) ?? 0
                    self.event.name = self.event.trackEventList[self.event.id]
                } else {
                    //Field Events
                    self.event.id = self.event.fieldEventList.firstIndex(of: $0) ?? 0
                    self.event.name = self.event.fieldEventList[self.event.id]
                }
                
            })
        
            VStack {
                Text("Event Type")
                Picker(selection: $trackOrField, label: Text("Event Type")) {
                    Text("Track").tag(0)
                    Text("Field").tag(1)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, 50)
                
                Text("Choose an Event: ")
                //We need to check if they want track results or field results
                //Multis need to go somehwere in here, could be a third option
                if(trackOrField == 0){
                    //Track Events
                    Picker(selection: eventSelector, label: Text("Choose an Event")
                            .multilineTextAlignment(.center)) {
                        ForEach(event.trackEventList, id : \.self) { item in
                            Text(String(item))
                        }
                    }
                            .pickerStyle(.wheel)
                            .frame(height: 125, alignment: .center)
                            .clipped()
                } else {
                    //Field Events
                    Picker(selection: eventSelector, label: Text("Choose an Event")
                            .multilineTextAlignment(.center)) {
                        ForEach(event.fieldEventList, id : \.self) { item in
                            Text(String(item))
                        }
                    }
                            .pickerStyle(.wheel)
                            .frame(height: 125, alignment: .center)
                            .clipped()
                }
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
