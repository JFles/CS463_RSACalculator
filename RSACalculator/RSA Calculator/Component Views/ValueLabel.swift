//
//  ValueLabel.swift
//  RSACalculator
//
//  Created by Jeremy Fleshman on 11/29/20.
//

import SwiftUI

struct ValueLabel: View {
    var label: String
    @Binding var input: String

    var body: some View {
        HStack {
            Text("\(label) = \(input)")
            Spacer()
        }
//        .padding()
        .padding(.leading, 20)
    }
}
