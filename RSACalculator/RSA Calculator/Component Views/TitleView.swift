//
//  TitleView.swift
//  RSACalculator
//
//  Created by Jeremy Fleshman on 11/29/20.
//

import SwiftUI

struct TitleView: View {
    var title: String

    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .bold()

        }
        .frame(alignment: .center)
        .padding()
    }
}
