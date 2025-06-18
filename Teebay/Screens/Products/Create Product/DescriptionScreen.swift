//
//  DescriptionScreen.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/17/25.
//

import SwiftUI

struct DescriptionScreen: View {
    @Environment(\.dismiss) var dismiss

    @State var description: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            Text("Select Description")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)

            TextField("", text: $description)
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .border(Color.gray, width: 1.5)

            HStack {
                Button {
                    dismiss()
                } label: {
                    Text("BACK")
                        .font(.headline)
                        .padding()
                        .foregroundStyle(.white)
                        .background(.purple)
                }

                Spacer()

//                NavigationLink(destination:)
            }
        }
        .padding(.horizontal, 40)
    }
}

#Preview {
    DescriptionScreen()
}
