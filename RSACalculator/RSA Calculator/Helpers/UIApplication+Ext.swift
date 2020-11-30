//
//  UIApplication+Ext.swift
//  RSACalculator
//
//  Created by Jeremy Fleshman on 11/29/20.
//

import UIKit

/// Used to dismiss the keyboard -- especially the numpad
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
