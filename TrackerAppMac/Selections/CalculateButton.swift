//
//  CalculateButton.swift
//  TrackerApp
//
//  Created by Craig on 11/10/21.
//

import SwiftUI

struct CalculateButton: View {
    
    @EnvironmentObject var event: Event
    @State private var selection: String? = nil
    
    var body: some View {
        ZStack{
            NavigationLink(destination: Results(), tag: "Results", selection: $selection) { EmptyView() }.hidden()
            Button(action: {
                event.trackOrField == 0 ? event.result.load(event.trackCSV[event.id]) : event.result.load(event.fieldCSV[event.id])
                self.selection = "Results"
            }, label: {
                HStack {
                    Image(systemName: "return.right")
                    Text("Calculate")
                }
            })
        }
    }
}

struct CalculateButton_Previews: PreviewProvider {
    static let event = Event()
    
    static var previews: some View {
        CalculateButton().environmentObject(event)
    }
}
