//
//  StepThree.swift
//  RSACalculator
//
//  Created by Jeremy Fleshman on 11/29/20.
//

import SwiftUI

struct StepThree: View {
    @ObservedObject var viewModel: RSACalculatorViewModel

    var body: some View {
        StepHeader(step: "Step 3")

        /// # Step 3.1
        /// Enter message `m` to encrypt
        /// `m` must be:
        ///     - a positive integer `m` where `1 < m < N`
        ///

        MessageHeader(message: "Messages are represented as positive integers for encryption and decryption. The message, m, must satisfy `1 < m < N`")

        LabeledValueEntry(label: "Message m:", placeholder: "Enter a positive number", input: $viewModel.mInput)


        /// # Step 3.2
        /// Compute ciphertext `c`
        /// `c = m^e mod N`
        ///     - Note, this requires Bob's public key `(N, e)`
        ///

        MessageHeader(message: "The message, m, is encrypted with the following formula to produce ciphertext, c:")

        Text("c = m^e mod N").italic()

        Button(
            action: {
                //                viewModel.calcN()
                //                viewModel.calcR()
            },
            label: {
                Text("Encrypt m") }
        )
        .padding()

        ValueLabel(label: "c", input: $viewModel.c)
    }
}

struct StepThree_Previews: PreviewProvider {
    static var previews: some View {
        RSACalculatorView(viewModel: RSACalculatorViewModel())
    }
}
