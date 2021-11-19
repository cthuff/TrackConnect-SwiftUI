//
//  FieldEvents.swift
//  TrackerApp
//
//  Created by Craig on 11/19/21.
//

import SwiftUI

struct FieldEvents: View {
    @EnvironmentObject var event: Event
    
    var body: some View {
        //event.ID is a publsihed variable and each time it changes this binding gets hit to update even when no selected
        //To prevent and index OOB, cap the variable at the size of the list, since the size won't grow
        let fieldEventSelector = Binding<String>(
            get: { event.id > 7 ? self.event.fieldEventList[7] : self.event.fieldEventList[event.id]},
            set: {
                self.event.id = self.event.fieldEventList.firstIndex(of: $0) ?? 0
                self.event.name = self.event.fieldEventList[self.event.id]
            })
        
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
}

struct FieldEvents_Previews: PreviewProvider {
    static let event = Event()
    static var previews: some View {
        FieldEvents().environmentObject(event)
    }
}
