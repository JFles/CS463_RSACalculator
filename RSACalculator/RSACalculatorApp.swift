//
//  RSACalculatorApp.swift
//  RSACalculator
//
//  Created by Jeremy Fleshman on 11/23/20.
//

import SwiftUI

@main
struct RSACalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            RSACalculatorView(viewModel: RSACalculatorViewModel())
        }
    }
}
