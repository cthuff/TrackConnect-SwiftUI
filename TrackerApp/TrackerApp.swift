//
//  TrackerAppApp.swift
//  TrackerApp
//
//  Created by Craig on 11/4/21.
//

import SwiftUI

@main
struct TrackerApp: App {
    static let event = Event()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(TrackerApp.event)
        }
    }
}
