//
//  ResultRow.swift
//  TrackerApp
//
//  Created by Craig on 11/9/21.
//

import SwiftUI

struct EventResultRow: View {

    var event: String
    var place: Int
    var result: String
    
    var body: some View {
        HStack{
            Text(verbatim: "\(event)")
            Spacer()
            Text(verbatim: "\(place)")
                .bold()
            Spacer()
            Text("\(result)")
                .italic()
        }
        .font(.title3)
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
    }
}

struct EventResultRow_Previews: PreviewProvider {

    static var year = Calendar.current.component(.year, from: Date())
    static var event = "3000m Steeplechase"
    static var place = 1
    static var result = "08:30.12"
    
    static var previews: some View {
        EventResultRow(event: event, place: place, result: result)
    }
}
