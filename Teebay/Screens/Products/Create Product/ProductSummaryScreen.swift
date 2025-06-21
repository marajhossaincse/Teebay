//
//  ProductSummaryScreen.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/18/25.
//

import SwiftUI

struct ProductSummaryScreen: View {
    @Environment(\.dismiss) var dismiss

    @Bindable var viewModel: ProductCreationViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()

            Text("Summary")
                .font(.headline)

            Text("Title: \(viewModel.title)")
                .padding(.vertical)

            Text("Categories:")
            Text(viewModel.categories.isEmpty ? "No categories selected" : viewModel.categories.joined(separator: ", "))

            Text("Description: \(viewModel.description)")
                .padding(.vertical)

            Text("Price: $\(viewModel.purchasePrice)")
            Text("To rent: $\(viewModel.rentPrice)")
            Text("per day")
                .padding(.bottom)

            HStack {
                Button {
                    dismiss()
                } label: {
                    CustomButtonView(name: "BACK")
                }

                Spacer()

                Button {
                    // CALL POST API FOR CREATING PRODUCTS
                } label: {
                    CustomButtonView(name: "SUBMIT")
                }
            }

            Spacer()
        }
        .padding(.horizontal, 40)
    }
}

#Preview {
    ProductSummaryScreen(viewModel: ProductCreationViewModel())
}
