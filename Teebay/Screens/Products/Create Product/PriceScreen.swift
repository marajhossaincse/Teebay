//
//  PriceScreen.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/18/25.
//

import SwiftUI

struct PriceScreen: View {
    @Environment(\.dismiss) var dismiss

    @Bindable var viewModel: ProductCreationViewModel

    var rentalOptions = ["per hour", "per day"]

    var body: some View {
        VStack(spacing: 20) {
            Text("Select price")
                .font(.headline)
                .frame(maxWidth: .infinity)

            TextField("Purchase price", text: $viewModel.purchasePrice)
                .textFieldStyle()

            Text("Rent")

            TextField("Rent price", text: $viewModel.rentPrice)
                .textFieldStyle()

            Picker("Select option", selection: $viewModel.rentOption) {
                ForEach(rentalOptions, id: \.self) {
                    Text($0)
                }
            }

            HStack {
                Button {
                    dismiss()
                } label: {
                    CustomButtonView(name: "BACK")
                }

                Spacer()

                NavigationLink(destination: ProductSummaryScreen(viewModel: viewModel)) {
                    CustomButtonView(name: "NEXT")
                }
            }
            .padding(.horizontal, 40)

            Spacer()
        }
        .padding(.horizontal, 40)
    }
}

#Preview {
    PriceScreen(viewModel: ProductCreationViewModel())
}
