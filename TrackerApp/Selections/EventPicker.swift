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
        let trackEventSelector = Binding<String>(
            get: { self.event.trackEventList[event.id] },
            set: {
                self.event.id = self.event.trackEventList.firstIndex(of: $0) ?? 0
                self.event.name = self.event.trackEventList[self.event.id]
            })
        
        let fieldEventSelector = Binding<String>(
            get: { self.event.fieldEventList[event.id] },
            set: {
                self.event.id = self.event.fieldEventList.firstIndex(of: $0) ?? 0
                self.event.name = self.event.fieldEventList[self.event.id]
            })
        
            VStack {
                Text("Event Type")
                Picker(selection: $trackOrField, label: Text("Event Type")) {
                    Text("Track").tag(0)
                    Text("Field").tag(1)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, 50)
                //when the picker gets flipped, reset the ID since both variables use the same event.id tag
                .onChange(of: trackOrField) { _ in event.id = 0}
                
                Text("Choose an Event: ")
                //We need to check if they want track results or field results
                //Multis need to go somehwere in here, could be a third option
                if(trackOrField == 0){
                    //Track Events
                    Picker(selection: trackEventSelector, label: Text("Choose an Event")
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
                    Picker(selection: fieldEventSelector, label: Text("Choose an Event")
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
