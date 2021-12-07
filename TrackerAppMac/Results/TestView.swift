//
//  TestView.swift
//  TrackerAppMac
//
//  Created by Craig on 12/7/21.
//

import SwiftUI

struct TestView: View {
    
        @State private var selection: String? = nil

        var body: some View {
            NavigationView {
                ZStack {
                    NavigationLink(destination: Results(), tag: "Second", selection: $selection) { EmptyView() }.hidden()
                    Button("Tap to show second") {
                        self.selection = "Second"
                    }
                    Button("Tap to show third") {
                        self.selection = "Third"
                    }
                }
                .navigationTitle("Navigation")
            }
        }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
