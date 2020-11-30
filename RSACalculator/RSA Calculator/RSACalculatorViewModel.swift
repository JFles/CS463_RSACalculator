//
//  RSACalculatorViewModel.swift
//  RSACalculator
//
//  Created by Jeremy Fleshman on 11/25/20.
//

import SwiftUI
import Combine

final class RSACalculatorViewModel : ObservableObject {
    #warning("Can these be changed to an int type?")
    @Published var p = ""
    @Published var q = ""
    @Published var n = "?"
    @Published var r = "?"
    @Published var kValues = ["5", "7", "9", "5", "7", "9", "5", "7", "9", "5", "7", "9",
                              "5", "7", "9", "5", "7", "9", "5", "7", "9", "5", "7", "9",
                              "5", "7", "9", "5", "7", "9", "5", "7", "9", "5", "7", "9"]//[String]()
    @Published var e = "?"
    @Published var d = "?"
    @Published var m = ""
    @Published var c = "?"

    #warning("Add algorithm to determine K values and replace hardcoded values")

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
