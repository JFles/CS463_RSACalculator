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
