//
//  ProductSummaryScreen.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/18/25.
//

import SwiftUI

struct ProductSummaryScreen: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()

            Text("Summary")
                .font(.headline)

            Text("Title: MacBook Pro")
                .padding(.vertical)

            Text("Categories:")
            Text("cat 1, cat 2")

            Text("Description: Lorem ipsum")
                .padding(.vertical)

            Text("Price: $5000")
            Text("To rent: $50")
            Text("per day")
                .padding(.bottom)

            HStack {
                Button {
                    dismiss()
                } label: {
                    CustomButtonView(name: "BACK")
                }

                Spacer()

                NavigationLink(destination: PriceScreen()) {
                    CustomButtonView(name: "NEXT")
                }
            }

            Spacer()
        }
        .padding(.horizontal, 40)
    }
}

#Preview {
    ProductSummaryScreen()
}
