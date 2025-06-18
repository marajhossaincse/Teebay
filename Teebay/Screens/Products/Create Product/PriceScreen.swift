//
//  PriceScreen.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/18/25.
//

import SwiftUI

struct PriceScreen: View {
    @Environment(\.dismiss) var dismiss

    @State var price: String = ""
    @State var rentPrice: String  = ""

    @State private var selectedRentalOption = "per hour"
    var rentalOptions = ["per hour", "per day"]

    var body: some View {
        VStack(spacing: 20) {
            Text("Select price")
                .font(.headline)
                .frame(maxWidth: .infinity)

            TextField("Purchase price", text: $price)
                .textFieldStyle()

            Text("Rent")

            TextField("Rent price", text: $rentPrice)
                .textFieldStyle()

            Picker("Select option", selection: $selectedRentalOption) {
                ForEach(rentalOptions, id: \.self) {
                    Text($0)
                }
            }
        }
        .padding(.horizontal, 40)
    }
}

#Preview {
    PriceScreen(
        price: "1000",
        rentPrice: "100"
    )
}
