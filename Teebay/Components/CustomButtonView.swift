//
//  CustomButtonView.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/18/25.
//

import SwiftUI

struct CustomButtonView: View {
    var name: String

    var body: some View {
        Text(name)
            .font(.headline)
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}

#Preview {
    CustomButtonView(name: "Lorem")
}
