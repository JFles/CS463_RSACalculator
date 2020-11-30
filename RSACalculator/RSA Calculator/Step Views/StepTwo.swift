//
//  StepTwo.swift
//  RSACalculator
//
//  Created by Jeremy Fleshman on 11/29/20.
//

import SwiftUI

struct StepTwo: View {
    @ObservedObject var viewModel: RSACalculatorViewModel

    var body: some View {
        StepHeader(step: "Step 2")
            .padding(.vertical, 10)

        /// # Step 2.1
        /// Choose public key `e`
        /// `e` must be:
        ///     - one of the cofactors of `k`
        ///     - less than *and* coprime to `r = (p - 1)(q - 1)`
        ///

        MessageHeader(message: "Public key, e, is a positive integer which is a cofactor of K and it must be less than and coprime to r")

        ValueLabel(label: "e", input: $viewModel.e)

        /// # Step 2.2
        /// Choose private key `d`
        /// `d` must be:
        ///     - one of the cofactors of `k`
        ///     - such that `e * d == 1 mod r`
        ///

        #warning("Consider breaking the formula out into a separate Text")
        MessageHeader(message: "Private key, d, is a positive integer which is a cofactor of K and must be coprime to r and satisfy `e * d == 1 mod r`")

        ValueLabel(label: "d", input: $viewModel.d)

        /// # Step 2.3
        /// Display RSA Keypair
        ///  `((N, e), d)`
        ///     - Include in UI:
        ///         - The variable form (e.g. `((N, e), d)`)
        ///         - The const form (e.g. `((35, 7), 103)`)
        ///

        MessageHeader(message: "The calculated RSA Keypair appears in the following format:")

        Text("((N, e), d)").italic()

        MessageHeader(message: "Where N is the modulus used for encryption and decryption")

        MessageHeader(message: "The RSA Keypair for this session is as follows:")

        Text("((\(viewModel.n), \(viewModel.e), \(viewModel.d))")
    }
}

struct StepTwo_Previews: PreviewProvider {
    static var previews: some View {
        StepTwo(viewModel: RSACalculatorViewModel())
            .previewLayout(.sizeThatFits)
    }
}
