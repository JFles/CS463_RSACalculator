//
//  RSACalculatorViewModel.swift
//  RSACalculator
//
//  Created by Jeremy Fleshman on 11/25/20.
//

import SwiftUI
import Combine

let MaxKey = 100

final class RSACalculatorViewModel : ObservableObject {
    #warning("Can these be changed to an int type?")
    @Published var p = ""
    @Published var q = ""
    @Published var n = "?"
    @Published var r = "?"
    @Published var kValues = [String]()
    private var keyPairs = [(Int, Int)]()
    @Published var e = "?"
    @Published var d = "?"
    @Published var mInput = ""
    @Published var mOutput = "?"
    @Published var c = "?"


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

    func calcKVals() {
        guard let r = Int(r) else { return }
        kValues = []
        keyPairs = []

        computeKeyPairs(r: r, maxKey: MaxKey)

        for pair in keyPairs {
            let product = pair.0 * pair.1
            kValues.append(String(product))
        }
    }

    func getKValFactors(index: Int) {
        e = String(keyPairs[index].0)
        d = String(keyPairs[index].1)
    }

    #warning("Might be redundant -- consider removing")
    func rgcd(a: Int, b: Int) -> Int {
        if b == 0 { return a }
        return rgcd(a: b, b: a % b)
    }

    func modInverse(a: Int, m: Int) -> Int? {
        let tmp = a % m
        for i in 1..<m {
            if (tmp * i % m == 1) {
                return i;
            }
        }
        return nil
    }

    func validateFactors(_ e: Int, _ d: Int, _ r: Int) -> Bool {
        guard e > 1 && e < r else { return false }
        guard d > 1 else { return false }
        #warning("rgcd checks might be redundant")
        guard rgcd(a: e, b: r) == 1 else { return false }
        guard rgcd(a: d, b: r) == 1 else { return false }
        return true
    }

    func computeKeyPairs(r: Int, maxKey: Int) {
        for d in 2...maxKey {
            if let e = modInverse(a: d, m: r) {
                if validateFactors(e, d, r) {
                    keyPairs.append((e, d))
                }
            }
        }
    }
}
