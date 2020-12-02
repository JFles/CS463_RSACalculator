//
//  StepFour.swift
//  RSACalculator
//
//  Created by Jeremy Fleshman on 11/29/20.
//

import SwiftUI

struct StepFour: View {
    @ObservedObject var viewModel: RSACalculatorViewModel

    var body: some View {
        StepHeader(step: "Step 4")

        /// # Step 4.1
        /// Compute `m` from given ciphertext `c`
        /// `m = c^d mod N`

        MessageHeader(message: "The ciphertext, c, is decrypted with the following formula to produce message, m:")

        Text("m = c^d mod N").italic()

        Button(
            action: {
                viewModel.calcM()
            },
            label: {
                Text("Decrypt c") }
        )
        .padding()

        ValueLabel(label: "m", input: $viewModel.mOutput)
    }
}

struct StepFour_Previews: PreviewProvider {
    static var previews: some View {
        RSACalculatorView(viewModel: RSACalculatorViewModel())
    }
}

