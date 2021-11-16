//
//  ResultRow.swift
//  TrackerApp
//
//  Created by Craig on 11/9/21.
//

import SwiftUI

struct EventResultRow: View {

    @EnvironmentObject var event: Event
    
    var body: some View {
        HStack{
            Text(verbatim: "\(event.name)")
            Spacer()
            Text(verbatim: "\(event.result.place)")
                .bold()
            Spacer()
            Text("\(event.result.eventResult[event.result.place - 1][4])")
                .italic()
        }
        .font(.title3)
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
    }
}

struct EventResultRow_Previews: PreviewProvider {

    static var event = Event()
    
    static var previews: some View {
        EventResultRow().environmentObject(event)
    }
}
