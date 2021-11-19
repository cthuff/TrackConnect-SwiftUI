//
//  EventPicker.swift
//  TrackerApp
//
//  Created by Craig on 11/5/21.
//

//**Could look into making two classes 

import SwiftUI

struct EventPicker: View {
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
        
        //event.ID is a publsihed variable and each time it changes this binding gets hit to update even when no selected
        //To prevent and index OOB, cap the variable at the size of the list, since the size won't grow
        let fieldEventSelector = Binding<String>(
            get: { event.id > 7 ? self.event.fieldEventList[7] : self.event.fieldEventList[event.id]},
            set: {
                self.event.id = self.event.fieldEventList.firstIndex(of: $0) ?? 0
                self.event.name = self.event.fieldEventList[self.event.id]
            })
        //MARK: Main View
            VStack {
                Text("Event Type")
                Picker(selection: $event.trackOrField, label: Text("Event Type")) {
                    Text("Track").tag(0)
                    Text("Field").tag(1)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, 50)
                //when the picker gets flipped, reset the ID since both variables use the same event.id tag
                .onChange(of: event.trackOrField) { _ in event.id = 0}
                
                Text("Choose an Event: ")
                //We need to check if they want track results or field results
                //Multis need to go somehwere in here, could be a third option
                if(event.trackOrField == 0){
                    //MARK: Track Events
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
                    //MARK: Field Events
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
