//
//  CalculateButton.swift
//  TrackerApp
//
//  Created by Craig on 11/10/21.
//

import SwiftUI

struct CalculateButton: View {
    var body: some View {
        NavigationLink(destination: Results()) {
            Label("Calculate", systemImage: "return.right")
                .padding(10)
                .foregroundColor(.white)
                .background(Color("mainColor"))
                .cornerRadius(10)
        }
    }
}

struct CalculateButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculateButton()
    }
}
