//
//  AllProductsScreen.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/22/25.
//

import SwiftUI

struct AllProductsScreen: View {
    @StateObject var viewModel = ProductsViewModel()

    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                VStack(spacing: 8) {
                    ForEach(viewModel.products, id: \.self) { product in
                        ProductCard(
                            title: product.title,
                            categories: product.categories,
                            purchasePrice: product.purchasePrice,
                            rentPrice: product.rentPrice,
                            rentOption: product.rentOption,
                            description: product.description,
                            datePosted: product.datePosted
                        )
                    }
                }
                .padding(.bottom, 60)

                Button {
                    // navigate to create product screen
                } label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                .padding()
            }
        }
        .navigationTitle("MY PRODUCTS")
        .task {
            await viewModel.getProducts()
        }
    }
}

#Preview {
    AllProductsScreen()
}
