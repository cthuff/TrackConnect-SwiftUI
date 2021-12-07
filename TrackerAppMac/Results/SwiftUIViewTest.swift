//
//  SwiftUIViewTest.swift
//  TrackerAppMac
//
//  Created by Craig on 12/6/21.
//

import SwiftUI

struct SwiftUIViewTest: View {
    
        let colors: [Color] = [.gray, .red, .orange, .yellow,
                               .green, .blue, .purple, .pink]
        @State private var fgColor: Color = .gray

        var body: some View {
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 200, height: 200)
                .foregroundColor(fgColor)
        }
    
}

struct SwiftUIViewTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewTest()
    }
}
