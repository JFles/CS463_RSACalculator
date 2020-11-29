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

    }
}

struct StepTwo_Previews: PreviewProvider {
    static var previews: some View {
        StepTwo(viewModel: RSACalculatorViewModel())
            .previewLayout(.sizeThatFits)
    }
}
