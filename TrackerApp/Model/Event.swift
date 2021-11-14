//
//  Event.swift
//  TrackerApp
//
//  Created by Craig on 11/11/21.
//

import Foundation
import Combine

final class Event: ObservableObject {
    var eventList: Array<String> = ["100 Meters" , "110 Meter Hurdles" , "200 Meters" , "400 Meters" , "400 Meter Hurdles" , "800 Meters" , "1500 Meters" , "3000 Steeplechase" , "5,000 Meters" , "10,000 Meters" , "4x100 Meter Relay" , "4x400 Meter Relay" , "Triple Jump" , "Long Jump" , "High Jump" , "Pole Vault" , "Javelin" , "Shot Put" , "Discus" , "Hammer Throw"]
    var year : Array<String> = ["2021", "2020", "2019", "2018"]
    var name: String = String()
    @Published var id: Int = Int()
    var result: Result = Result()
    var placement: Int = Int()
}

