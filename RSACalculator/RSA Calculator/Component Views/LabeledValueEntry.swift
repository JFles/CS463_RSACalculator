//
//  LabeledValueEntry.swift
//  RSACalculator
//
//  Created by Jeremy Fleshman on 11/29/20.
//

import SwiftUI

struct LabeledValueEntry: View {
    var label: String
    var placeholder: String
    @Binding var input: String

    var body: some View {
        HStack {
            Text(label)
            TextField(placeholder, text: $input)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
        }.padding(.horizontal, 20)
    }
}
