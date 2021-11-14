//
//  ResultsView.swift
//  TrackerApp
//
//  Created by Craig on 11/9/21.
//

import SwiftUI

struct Results: View {
    
    @EnvironmentObject var event: Event
    
//    var event: String = "3000m Steeplechase"
//    var result: String = "08.31.1"
    var body: some View {
        
        ZStack {
            Color("backgroundColor")
                .ignoresSafeArea()
            VStack{
                Text("Results")
                    .font(.title2)
                EventResultRow(event: event.name, place: 1, result: event.result.mark)
                EventResultRow(event: event.name, place: 1, result: event.result.mark)
                EventResultRow(event: event.name, place: 1, result: event.result.mark)
                Text("Previous Years")
                    .font(.title2)
                    .padding(.top, 30)
                ForEach(event.eventList, id : \.self) { item in
                    Text(String(item))
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            self.event.id = event.id
        }
    }
}

struct Results_Previews: PreviewProvider {
    
    static var event = Event()
    
    static var previews: some View {
//        Results(result: "08:30.2").environmentObject(event)
        Results().environmentObject(event)
    }
}
