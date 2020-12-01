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
    @State private var showingAlert = false

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
                if viewModel.primeCheck() {
                    viewModel.calcN()
                    viewModel.calcR()
                    viewModel.calcKVals()
                } else {
                    self.showingAlert = true
                }
                UIApplication.shared.endEditing()
            },
            label: {
                Text("Calculate N and r") }
        ).alert(isPresented: $showingAlert) {
            Alert(title: Text("Non-prime number detected!"), message: Text("Try entering a prime number for both p and q"), dismissButton: .default(Text("OK")))
        }
        .padding()


        /// Present calculated `N` and `r`
        ///
        ValueLabel(label: "N = p * q", input: $viewModel.n)
            .padding(.bottom, 10)

        ValueLabel(label: "r = (p - 1) * (q - 1)", input: $viewModel.r)

        SelectKSection(viewModel: viewModel, selectedK: $selectedK)

        if !viewModel.kValues.isEmpty {
            Button(action: {
                viewModel.getKValFactors(index: selectedK)
            }, label: {
                Text("Get Factors of K")
            })

            HStack {
                Text("K = \(viewModel.e) * \(viewModel.d)")

                Spacer()
            }.padding(.leading, 20)
        }
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
    @Binding var selectedK: Int

    var body: some View {
        /// # Step 1.4
        /// Display valid K value candidates
        /// `K = (e * d) == 1 mod r`
        ///
        MessageHeader(message: "Select a valid K value to determine e and d")

        HStack {
            Text("K = (e * d) == 1 mod r")
            Spacer()
        }.padding()

        if !viewModel.kValues.isEmpty {
            Picker("Select K Value", selection: $selectedK, content: {
                ForEach(0..<viewModel.kValues.count) { index in
                    Text(viewModel.kValues[index])
                        .tag(index)
                }
            }).pickerStyle(MenuPickerStyle())
            .padding()
        }

        HStack {
            if viewModel.kValues.isEmpty {
                Text("K = ?")
            } else {
                Text("K = \(viewModel.kValues[selectedK]) == 1 mod \(viewModel.r)")
            }

            Spacer()
        }.padding()
    }
}
