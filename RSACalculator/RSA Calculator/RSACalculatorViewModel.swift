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
    #warning("Can these be changed to an int type?")
    @Published var p = ""
    @Published var q = ""
    @Published var n = "?"
    @Published var r = "?"
    @Published var kValues = [String]()
    private var keyPairs = [(BigInt, BigInt)]()
    @Published var e = "?"
    @Published var d = "?"
    @Published var mInput = ""
    @Published var mOutput = "?"
    @Published var c = "?"


    func primeCheck() -> Bool {
        guard let p = BigInt(p),
              let q = BigInt(q) else { return false }

        return isPrime(p) && isPrime(q)
    }

    func isPrime(_ n: BigInt) -> Bool {
        n.isPrime()
    }

    func resetAllFields() {
        #warning("Implement a reset of all published and calculated values")
    }

    func calcN() {
        guard let p = BigInt(p),
              let q = BigInt(q) else { return }

        resetAllFields()

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

        #warning("BUG - Missing a lot of key pairs after chainging this to BigInt")
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

    func validateFactors(_ e: BigInt, _ d: BigInt, _ r: BigInt) -> Bool {
        guard e > 1 && e < r else { return false }
        guard d > 1 else { return false }
        return true
    }

    func computeKeyPairs(r: BigInt, maxKey: BigInt) {
        for e in 2...maxKey {
            if let d = e.inverse(r) {
                if validateFactors(e, d, r) {
                    keyPairs.append((e, d))
                }
            }
        }
    }
}
