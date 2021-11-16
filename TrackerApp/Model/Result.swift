//
//  Result.swift
//  TrackerApp
//
//  Created by Craig on 11/13/21.
//

import Foundation
import Combine

struct Result {
    var place: Int = 95
    var mark: String = ""
    
    var eventResult: Array<Array<String>> = Array<Array<String>>()
    var year1: [String] = [String]()
    var year2: [String] = [String]()
    var year3: [String] = [String]()
    var year4: [String] = [String]()
    
    mutating func load(_ filename: String) {
        eventResult.removeAll()
        let file = Bundle.main.url(forResource: filename, withExtension: nil)
        let text = try! String(contentsOf: file!)
        var lines = text.components(separatedBy: "\r\n")
        lines.remove(at: 95)
        
        for line in lines {
            let split = line.components(separatedBy: "\t")
            eventResult.append(split)
        }
        eventResult.append(["", "", "", "", mark as String])
        eventResult.sort(by: {$0[4] < $1[4]})
        var i = 0
        while place == 95 {
//            for array in eventResult {
//                place = array.firstIndex(of: mark) ?? 95
//                if(place != 95) { break }
//            }
            if (eventResult[i].firstIndex(of: mark) != nil) {
                place = i
            } else {
                i += 1
            }
        }
        
        
//        return eventResult
    }
}
