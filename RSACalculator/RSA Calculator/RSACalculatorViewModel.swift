//
//  RSACalculatorViewModel.swift
//  RSACalculator
//
//  Created by Jeremy Fleshman on 11/25/20.
//

import SwiftUI
import Combine

final class RSACalculatorViewModel : ObservableObject {
    @Published var p = ""
    @Published var q = ""
    @Published var n = ""
    @Published var r = ""

    func primeCheck() -> Bool {
        guard let p = Int(p),
              let q = Int(q) else { return false }

        return isPrime(p) && isPrime(q)
    }

    func isPrime(_ n: Int) -> Bool {
        guard n >= 2     else { return false }
        guard n != 2     else { return true  }
        guard n % 2 != 0 else { return false }
        return !stride(from: 3, through: Int(sqrt(Double(n))), by: 2).contains { n % $0 == 0 }
    }

    func calcN() {
        guard let p = Int(p),
              let q = Int(q) else { return }

        n = String(p * q)
    }

    func calcR() {
        guard let p = Int(p),
              let q = Int(q) else { return }

        r = String((p - 1) * (q - 1))
    }
}