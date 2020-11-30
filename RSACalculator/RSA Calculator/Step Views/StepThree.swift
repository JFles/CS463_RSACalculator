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


        /// # Step 3.2
        /// Compute ciphertext `c`
        /// `c = m^e mod N`
        ///     - Note, this requires Bob's public key `(N, e)`
        ///
    }
}

struct StepThree_Previews: PreviewProvider {
    static var previews: some View {
        RSACalculatorView(viewModel: RSACalculatorViewModel())
    }
}
