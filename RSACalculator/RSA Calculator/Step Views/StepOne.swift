//
//  StepOne.swift
//  RSACalculator
//
//  Created by Jeremy Fleshman on 11/29/20.
//

import SwiftUI

struct StepOne: View {
    @ObservedObject var viewModel: RSACalculatorViewModel

    var body: some View {
        /// # Step 1.1
        /// Choose prime `p` and `q`
        ///
        TitleView(title: "RSA Calculator")

        StepHeader(step: "Step 1")

        LabeledValueEntry(label: "Prime p:", placeholder: "Enter a prime number", input: $viewModel.p)

        LabeledValueEntry(label: "Prime q:", placeholder: "Enter a prime number", input: $viewModel.q)


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
        LabeledValueEntry(label: "N = p * q", placeholder: "N", input: $viewModel.n)

        LabeledValueEntry(label: "r = (p - 1) * (q - 1)", placeholder: "r", input: $viewModel.r)


        /// # Step 1.4
        /// Display valid K value candidates
        #warning("Should this only display the K values that meet both requirements?")
        /// `K = (e * d) == 1 mod r`
        ///
    }
}

struct StepOne_Previews: PreviewProvider {
    static var previews: some View {
        StepOne(viewModel: RSACalculatorViewModel())
            .previewLayout(.sizeThatFits)
    }
}
