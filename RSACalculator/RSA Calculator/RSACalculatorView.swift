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
                PublicValueEntry(label: "Prime p:", placeholder: "Enter a prime number", input: $viewModel.p)

                PublicValueEntry(label: "Prime q:", placeholder: "Enter a prime number", input: $viewModel.q)

                Button(
                    action: {
                        viewModel.calcN()
                        viewModel.calcR()
                    },
                    label: {
                        Text("Calculate N and r") }
                )
                .padding()

                PublicValueEntry(label: "N = p * q", placeholder: "N", input: $viewModel.n)

                PublicValueEntry(label: "r = (p - 1) * (q - 1)", placeholder: "r", input: $viewModel.r)

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
