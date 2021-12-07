//
//  ContentView.swift
//  TrackerApp
//
//  Created by Craig on 11/4/21.
//

import SwiftUI


struct ContentView: View {
    
    @EnvironmentObject var event: Event
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("backgroundColor")
                    .ignoresSafeArea()
                VStack() {
                    Text("Track Calculator")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    OptionsView()
                    EventPicker()
                        .padding(.bottom)
                }
                .foregroundColor(Color("mainColor"))
//                .offset(y: -UIScreen.main.bounds.height / 14)
            }
            .labelsHidden()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static let event = Event()
    static var previews: some View {
        ContentView().environmentObject(event)
//            .preferredColorScheme(.dark)
//        ForEach(["iPhone SE (2nd generation)", "iPhone 13 Pro"], id: \.self) { deviceName in
//                ContentView()
//                        .environmentObject(event)
//                        .previewDevice(PreviewDevice(rawValue: deviceName))
//                        .previewDisplayName(deviceName)
//        }
    }
}
