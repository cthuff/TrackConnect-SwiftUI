//
//  CalculateButton.swift
//  TrackerApp
//
//  Created by Craig on 11/10/21.
//

import SwiftUI

struct CalculateButton: View {
    
    @EnvironmentObject var event: Event
    
    var body: some View {
        NavigationLink(destination: Results()) {
            Label("Calculate", systemImage: "return.right")
                .padding(10)
                .foregroundColor(.white)
                .background(Color("mainColor"))
                .cornerRadius(10)
        }
        .simultaneousGesture(TapGesture().onEnded({
            event.trackOrField == 0 ? event.result.load(event.trackCSV[event.id]) : event.result.load(event.fieldCSV[event.id])
            //handled this way becasue the tap selector was causing the load to be called anytime the screen was tapped
        }))
    }
}

struct CalculateButton_Previews: PreviewProvider {
    static let event = Event()
    
    static var previews: some View {
        CalculateButton().environmentObject(event)
    }
}
