//
//  StepHeader.swift
//  RSACalculator
//
//  Created by Jeremy Fleshman on 11/29/20.
//

import SwiftUI

struct StepHeader: View {
    var step: String

    var body: some View {
        HStack {
            Text(step)
                .font(.title2)
                .underline()

            Spacer()
        }
        .padding(.leading, 20)
        .padding(.vertical, 10)
    }
}
