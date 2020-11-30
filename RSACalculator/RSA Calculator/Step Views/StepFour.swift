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
    }
}

struct StepFour_Previews: PreviewProvider {
    static var previews: some View {
        RSACalculatorView(viewModel: RSACalculatorViewModel())
    }
}

