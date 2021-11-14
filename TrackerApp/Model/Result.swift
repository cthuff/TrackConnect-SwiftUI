//
//  Result.swift
//  TrackerApp
//
//  Created by Craig on 11/13/21.
//

import Foundation
import Combine

struct Result {
    var place: Int = 0
    var mark: String = ""
    var eventResult: [String] = [""]
    
    mutating func load(_ filename: String) -> [String] {
        let file = Bundle.main.url(forResource: filename, withExtension: nil)
        let text = try! String(contentsOf: file!)
        var lines = text.components(separatedBy: "\r\n")
        lines.remove(at: 95)
        
        for line in lines {
            let split = line.components(separatedBy: "\t")
            //            let place = split[0]
            let time = split[4]
            
            eventResult.append(time)
        }
        eventResult.append(mark)
        eventResult.sort()
        
        place = eventResult.firstIndex(of: mark) ?? 95
        
        return eventResult
    }
}
