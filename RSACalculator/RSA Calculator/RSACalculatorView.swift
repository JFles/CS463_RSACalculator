//
//  RSACalculatorView.swift
//  RSACalculator
//
//  Created by Jeremy Fleshman on 11/23/20.
//

import SwiftUI

struct RSACalculatorView: View {
    @ObservedObject var viewModel: RSACalculatorViewModel

    var body: some View {
        NavigationView {
            VStack {
                #warning("Should this be split into multiple views in a nav stack for each `chunk` or `Step`?")
                #warning("Or should this be in one scroll view?")
                // Depends on UI
                // If each `Step` gets a description heading, then it needs to be split into separate pages

                /// # Step 1.1
                /// Choose prime `p` and `q`
                ///
                PublicValueEntry(label: "Prime p:", placeholder: "Enter a prime number", input: $viewModel.p)

                PublicValueEntry(label: "Prime q:", placeholder: "Enter a prime number", input: $viewModel.q)


                /// # Step 1.2 and 1.3
                /// Calculate `N` and `r`
                ///
                Button(
                    action: {
                        viewModel.calcN()
                        viewModel.calcR()
                    },
                    label: {
                        Text("Calculate N and r") }
                )
                .padding()


                /// Present calculated `N` and `r`
                ///
                #warning("Should these be changed from TextFields to be some non-user-interactable UI element?")
                PublicValueEntry(label: "N = p * q", placeholder: "N", input: $viewModel.n)

                PublicValueEntry(label: "r = (p - 1) * (q - 1)", placeholder: "r", input: $viewModel.r)


                /// # Step 1.4
                /// Display valid K value candidates
                #warning("Should this only display the K values that meet both requirements?")
                /// `K = (e * d) == 1 mod r`
                ///


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

struct PublicValueEntry: View {
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
