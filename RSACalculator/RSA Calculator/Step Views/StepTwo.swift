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
            .padding(.top, 20)

        /// # Step 2.1
        /// Choose public key `e`
        /// `e` must be:
        ///     - one of the cofactors of `k`
        ///     - less than *and* coprime to `r = (p - 1)(q - 1)`
        ///


        /// # Step 2.2
        /// Choose private key `d`
        /// `d` must be:
        ///     - one of the cofactors of `k`
        ///     - such that `e * d == 1 mod r`
        ///


        /// # Step 2.3
        /// Display RSA Keypair
        ///  `((N, e), d)`
        ///     - Include in UI:
        ///         - The variable form (e.g. `((N, e), d)`)
        ///         - The const form (e.g. `((35, 7), 103)`)
        ///

    }
}

struct StepTwo_Previews: PreviewProvider {
    static var previews: some View {
        StepTwo(viewModel: RSACalculatorViewModel())
            .previewLayout(.sizeThatFits)
    }
}
