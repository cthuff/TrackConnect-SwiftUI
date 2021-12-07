//
//  Event.swift
//  TrackerApp
//
//  Created by Craig on 11/11/21.
//

import Foundation
import Combine

final class Event: ObservableObject {
    var name: String = String()
    var id: Int = Int()
    @Published var result: Result = Result()
    var placement: Int = Int()
    @Published var trackOrField : Int = Int()
    
    var trackEventList: Array<String> = ["100 Meters" , "110 Meter Hurdles" , "200 Meters" , "400 Meters" , "400 Meter Hurdles" , "800 Meters" , "1500 Meters" , "3000 Steeplechase" , "5,000 Meters" , "10,000 Meters" , "4x100 Meter Relay" , "4x400 Meter Relay" ]
    var fieldEventList: Array<String> = ["Triple Jump" , "Long Jump" , "High Jump" , "Pole Vault" , "Javelin" , "Shot Put" , "Discus" , "Hammer Throw"]
    var trackCSV: Array<String> = ["100FirstRound.csv", "110HFirstRound.csv", "200FirstRound.csv", "400FirstRound.csv", "400HFirstRound.csv", "800FirstRound.csv", "1500FirstRound.csv", "SteepleFirstRound.csv", "5kFirstRound.csv", "10kFirstRound.csv", "4x100FirstRound.csv", "4x400FirstRound.csv"]
    var fieldCSV: Array<String> = ["TripleJumpFirstRound.csv", "LongJumpFirstRound.csv", "HighJumpFirstRound.csv", "PoleVaultFirstRound.csv", "JavelinFirstRound.csv", "ShotPutFirstRound.csv", "DiscusFirstRound.csv", "HammerThrowFirstRound.csv"]
    var year : Array<Int> = [2021, 2020, 2019, 2018]
    
}
