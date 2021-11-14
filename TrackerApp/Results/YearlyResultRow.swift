//
//  YearlyResultsRow.swift
//  TrackerApp
//
//  Created by Craig on 11/10/21.
//

import SwiftUI

struct YearlyResultRow: View {
    
    var year: Int
    var result: String
    
    var body: some View {
        HStack{
            Text(verbatim: "\(year)")
                .bold()
            Spacer()
            Text(verbatim: "\(result)")
                .italic()
        }
        .font(.title3)
        .padding(.horizontal, 20)
        .padding(.vertical, 5)
    }
}

struct YearlyResultRow_Previews: PreviewProvider {
    static var year = Calendar.current.component(.year, from: Date())
    static var result = "08:30.12"
    
    static var previews: some View {
        YearlyResultRow(year: year, result: result)
    }
}
