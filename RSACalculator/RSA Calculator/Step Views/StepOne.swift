//
//  StepOne.swift
//  RSACalculator
//
//  Created by Jeremy Fleshman on 11/29/20.
//

import SwiftUI

struct StepOne: View {
    @ObservedObject var viewModel: RSACalculatorViewModel
    @State var selectedK = 0

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
        ValueLabel(label: "N = p * q", input: $viewModel.n)
            .padding(.bottom, 10)

        ValueLabel(label: "r = (p - 1) * (q - 1)", input: $viewModel.r)

        SelectKSection(viewModel: viewModel, selectedK: selectedK)

    }
}

struct StepOne_Previews: PreviewProvider {
    static var previews: some View {
//        StepOne(viewModel: RSACalculatorViewModel())
//            .previewLayout(.sizeThatFits)

        RSACalculatorView(viewModel: RSACalculatorViewModel())
    }
}

struct SelectKSection: View {
    @ObservedObject var viewModel: RSACalculatorViewModel
    @State var selectedK: Int

    var body: some View {
        /// # Step 1.4
        /// Display valid K value candidates
        #warning("Should this only display the K values that meet both requirements?")
        /// `K = (e * d) == 1 mod r`
        ///

        VStack {
            Text("Select a valid K value to determine e and d")
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal, 50)
                .padding(.vertical, 10)
                .font(.title3)
                .multilineTextAlignment(.center)

            HStack {
                Text("K = (e * d) == 1 mod r")
                Spacer()
            }

            Picker("Select K Value", selection: $selectedK, content: {
                ForEach(0..<viewModel.kValues.count) { index in
                    Text(viewModel.kValues[index])
                        .tag(index)
                }
            }).pickerStyle(MenuPickerStyle())

            HStack {
                Text("K = \(viewModel.kValues[selectedK])")
                Spacer()
            }
        }.padding()

    }
}
