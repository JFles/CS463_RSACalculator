//
//  RSACalculatorView.swift
//  RSACalculator
//
//  Created by Jeremy Fleshman on 11/23/20.
//

import SwiftUI

// MARK: - Main View
struct RSACalculatorView: View {
    @ObservedObject var viewModel: RSACalculatorViewModel

    var body: some View {
            ScrollView {
                VStack {
                    #warning("Should this be split into multiple views in a nav stack for each `chunk` or `Step`? Or should this be in one scroll view?")
                    // Depends on UI
                    // If each `Step` gets a description heading, then it needs to be split into separate pages

                    StepOne(viewModel: viewModel)


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

                    StepTwo(viewModel: viewModel)

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


                    /// # Step 4.1
                    /// Compute `m` from given ciphertext `c`
                    /// `m = c^d mod N`




                    Spacer()
                }
                .navigationBarTitle(Text("RSA Calculator"))
            }
    }
}

struct RSACalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        RSACalculatorView(viewModel: RSACalculatorViewModel())
    }
}
