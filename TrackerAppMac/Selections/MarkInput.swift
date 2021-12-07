//
//  MarkInput.swift
//  TrackerApp
//
//  Created by Craig on 11/10/21.
//

import SwiftUI

struct MarkInput: View {
    
    @EnvironmentObject var event: Event
    
    var body: some View {
        VStack {
            Text("Enter Your Mark")
            TextField("Mark", text: $event.result.mark)
                .frame(width: 200, alignment: .center)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
                .font(.body)
                .foregroundColor(Color("textColor"))
        }
    }
}

struct MarkInput_Previews: PreviewProvider {
    
    static let event = Event()
    static var previews: some View {
        MarkInput().environmentObject(event)
    }
}
