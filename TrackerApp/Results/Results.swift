//
//  Results.swift
//  TrackerApp
//
//  Created by Craig on 11/9/21.
//  This file loads the Results View after being called from the ContentView
//

import SwiftUI

struct Results: View {
    
    @EnvironmentObject var event: Event
    
    var body: some View {
        ZStack {
            Color("backgroundColor")
                .ignoresSafeArea()
            VStack{
                Text("Results")
                    .font(.title2)
                EventResultRow()
                Text("Previous Years")
                    .font(.title2)
                    .padding(.top, 30)
                ForEach(event.year, id : \.self) { item in
                    YearlyResultRow(year: item, result: event.result.eventResult[event.result.place][item - 2018])
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
        Results().environmentObject(event)
    }
}
