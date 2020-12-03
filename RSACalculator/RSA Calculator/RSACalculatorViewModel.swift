//
//  RSACalculatorViewModel.swift
//  RSACalculator
//
//  Created by Jeremy Fleshman on 11/25/20.
//

import SwiftUI
import BigInt

let MaxKey: BigInt = 100

final class RSACalculatorViewModel : ObservableObject {
    @Published var p = "" {
        didSet { if oldValue != p { clearAllFields() } }
    }
    @Published var q = "" {
        didSet { if oldValue != q { clearAllFields() } }
    }
    @Published var n = "?"
    @Published var r = "?"
    @Published var kValues = [String]()
    private var keyPairs = [(BigInt, BigInt)]()
    @Published var e = "?"
    @Published var d = "?"
    @Published var mInput = "" {
        didSet { if oldValue != mInput { clearMFields() } }
    }
    @Published var mOutput = "?"
    @Published var c = "?"


    func primeCheck() -> Bool {
        guard let p = BigInt(p),
              let q = BigInt(q) else { return false }

        return isPrime(p) && isPrime(q) && p != q
    }

    func isPrime(_ n: BigInt) -> Bool {
        n.isPrime()
    }

    func validateM() -> Bool {
        guard let m = Int(mInput),
              let n = Int(n) else { return false }
        if m > 1 && m < n {
            return true
        }
        return false
    }

    func clearAllFields() {
        n = "?"
        r = "?"
        kValues = [String]()
        keyPairs = [(BigInt, BigInt)]()
        clearKeyFields()
        mInput = ""
        clearMFields()
    }

    func clearKeyFields() {
        e = "?"
        d = "?"
    }

    func clearMFields() {
        mOutput = "?"
        c = "?"
    }

    func calcN() {
        guard let p = BigInt(p),
              let q = BigInt(q) else { return }

        n = String(p * q)
    }

    func calcR() {
        guard let p = BigInt(p),
              let q = BigInt(q) else { return }

        r = String((p - 1) * (q - 1))
    }

    func calcKVals() {
        guard let r = BigInt(r) else { return }
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

    func calcC() {
        /// `c = m^e mod n`
        guard let m = BigInt(mInput),
              let e = BigInt(e),
              let n = BigInt(n) else { return }

        c = String(m.power(e, modulus: n))
    }

    func calcM() {
        /// `m = c^d mod n`
        guard let c = BigInt(c),
              let d = BigInt(d),
              let n = BigInt(n) else { return }

        mOutput = String(c.power(d, modulus: n))
    }

    func computeKeyPairs(r: BigInt, maxKey: BigInt) {
        for d in 2...maxKey {
            if let e = d.inverse(r) {
                keyPairs.append((e, d))
            }
        }
    }
}
