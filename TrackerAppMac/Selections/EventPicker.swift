//
//  EventPicker.swift
//  TrackerApp
//
//  Created by Craig on 11/5/21.
//

//**Could look into making two classes so 

import SwiftUI

struct EventPicker: View {
    @EnvironmentObject var event: Event
    
    var body: some View {
        
            VStack {
                Text("Event Type")
                Picker(selection: $event.trackOrField, label: Text("Event Type")) {
                    Text("Track").tag(0)
                    Text("Field").tag(1)
                }
                .pickerStyle(.segmented)
                .padding(.bottom, 15)
                //when the picker gets flipped, reset the ID since both variables use the same event.id tag
                .onChange(of: event.trackOrField) { _ in event.id = 0}
                
                Text("Choose an Event: ")
                //We need to check if they want track results or field results
                //Multis need to go somehwere in here, could be a third option
                if(event.trackOrField == 0){
                    TrackEvents()
                } else {
                    FieldEvents()
                }
                MarkInput()
                CalculateButton()
                    .padding(.vertical, 10)
        }
            .padding(.horizontal, 50)
    }
}

struct EventPicker_Previews: PreviewProvider {
    static let event = Event()
    
    static var previews: some View {
        EventPicker().environmentObject(event)
    }
}
