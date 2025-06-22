//
//  ProductsViewModel.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/22/25.
//

import Foundation

@MainActor
class ProductsViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var errorMessage: String? = nil
    @Published var isLoading = false

    func getProducts() async {
        isLoading = true
        errorMessage = nil

        do {
            let result = try await DataSource.request(api: ProductsAPI.getProducts, type: [Product].self)

            products = result
        } catch {
            print(error.localizedDescription)
        }
    }
}
