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
    var gender: Int = 1
    var division: Int = 1
    var region: Int = 1

    //The solution may be to save this as a JSON with 4 Arrays + The other related events
    //Would also make the load function much shorter and not need a 3d array
    
    var eventResult: Array<Array<String>> = Array<Array<String>>()
    
    mutating func load(_ filename: String) {
        //clear any previous info before loading the data again
        //**Could potentially save the event name and if it changes then load a new file about it**
        eventResult.removeAll()
        place = 95
        
        //Load the information from the CSV
        let file = Bundle.main.url(forResource: filename, withExtension: nil)
        let text = try! String(contentsOf: file!)
        var lines = text.components(separatedBy: "\r\n")
        
        //adds a blank array at the end to catch results that are too large
        lines.remove(at: 95)
        
        for line in lines {
            let split = line.components(separatedBy: "\t")
            eventResult.append(split)
        }
        
        //append the input to the 3D array, sort, and find the placement
        //**Large Big(O) cost here, could look to optimize**
        eventResult.append(["", "", "", "", mark as String])
        eventResult.sort(by: {$0[4] < $1[4]})
        var i = 0
        while place == 95 {
            if (eventResult[i].firstIndex(of: mark) != nil) {
                place = (i > 0 ? i - 1 : 1)
                //if you enter a mark that is better than the best, it will return the best mark (top of the list)
            } else {
                i += 1
            }
        }
    }
}
