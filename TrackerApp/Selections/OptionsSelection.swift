//
//  OptionsView.swift
//  TrackerApp
//
//  Created by Craig on 11/5/21.
//

import SwiftUI

struct OptionsView: View {
    
    @EnvironmentObject var event: Event
    
    @State private var gender = 1
    @State private var divison = 1
    @State private var region = 1
    
    var body: some View {
        VStack {
            Text("Gender")
            Picker(selection: $gender, label: Text("Gender")) {
                Text("Male").tag(1)
                Text("Female").tag(2)
            }
            
            Text("NCAA Division")
            Picker(selection: $divison, label: Text("Divison")) {
                Text("DI").tag(1)
                Text("DII").tag(2)
                Text("DIII").tag(3)
            }
            if(divison == 1)
            {
                VStack {
                    Text("Region")
                    Picker(selection: $region, label: Text("Region")) {
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
        
    }
}

struct OptionsView_Previews: PreviewProvider {
    static let event = Event()
    
    static var previews: some View {
        OptionsView().environmentObject(event)
    }
}
