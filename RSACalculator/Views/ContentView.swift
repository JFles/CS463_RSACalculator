//
//  ContentView.swift
//  RSACalculator
//
//  Created by Jeremy Fleshman on 11/23/20.
//

import SwiftUI

struct ContentView: View {
    @State private var p = ""

    var body: some View {
        NavigationView {
            VStack {
                PublicValueEntry(label: "Prime p:", placeholder: "Enter a prime number", input: $p)


                Spacer()
            }
            .navigationBarTitle(Text("RSA Calculator"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
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
        }.padding()
    }
}
