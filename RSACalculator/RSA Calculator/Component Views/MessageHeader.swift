//
//  MessageHeader.swift
//  RSACalculator
//
//  Created by Jeremy Fleshman on 11/29/20.
//

import SwiftUI

struct MessageHeader: View {
    var message: String

    var body: some View {
        Text(message)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.horizontal, 50)
            .padding(.vertical, 10)
            .font(.title3)
            .multilineTextAlignment(.center)
    }
}

struct MessageHeader_Previews: PreviewProvider {
    static var previews: some View {
        MessageHeader(message: "")
    }
}
