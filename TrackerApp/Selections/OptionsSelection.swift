//
//  OptionsView.swift
//  TrackerApp
//
//  Created by Craig on 11/5/21.
//

import SwiftUI

struct OptionsView: View {
    
    @EnvironmentObject var event: Event
    
    //these two variables help with the hiding of region picker when it's not needed
    @State private var showPicker = true
    @State private var division = 1
    
    var body: some View {
        VStack {
            Text("Gender")
            Picker(selection: $event.result.gender, label: Text("Gender")) {
                Text("Male").tag(1)
                Text("Female").tag(2)
            }
            
            Text("NCAA Division")
            Picker(selection: $division, label: Text("Division")) {
                Text("DI").tag(1)
                Text("DII").tag(2)
                Text("DIII").tag(3)
            }
            //toggles the picker for Region (which is only a Division 1 thing)
            .onChange(of: division){ _ in
                withAnimation(Animation.linear(duration: 0.3)) {
                    switch division {
                    case 1:
                        !showPicker ? showPicker.toggle() : nil
                        self.event.result.division = division
                    default:
                        showPicker ? showPicker.toggle() : nil
                        self.event.result.division = division
                    }
                                }
            }
            if(showPicker)
            {
                VStack {
                    Text("Region")
                    Picker(selection: $event.result.region, label: Text("Region")) {
                        Text("West").tag(1)
                        Text("East").tag(2)
                    }
                }
                
            }
        }
        .onAppear(){
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(red: 0.125, green: 0.678, blue: 0.965, alpha: 0.9)
        }
        .padding(.horizontal, 50)
        .pickerStyle(.segmented)
        //Leaving this disabled until I can load all of the other results properly 
        .disabled(true)
    }
}

struct OptionsView_Previews: PreviewProvider {
    static let event = Event()
    
    static var previews: some View {
        OptionsView().environmentObject(event)
    }
}
