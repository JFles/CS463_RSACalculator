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
        ScrollView {
            VStack {
                StepOne(viewModel: viewModel)
                StepTwo(viewModel: viewModel)
                StepThree(viewModel: viewModel)
//                StepFour(viewModel: viewModel)
                Spacer()
            }
        }
    }
}

struct RSACalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        RSACalculatorView(viewModel: RSACalculatorViewModel())
    }
}
