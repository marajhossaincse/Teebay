//
//  ProductsViewModel.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/22/25.
//

import Foundation

@MainActor
class ProductsViewModel: ObservableObject {
    @Published var products: [ProductResponse] = []
    @Published var errorMessage: String? = nil
    @Published var isLoading = false

    func getProducts() async {
        isLoading = true
        errorMessage = nil

        do {
            let result = try await DataSource.request(api: ProductsAPI.getProducts, type: [ProductResponse].self)

            products = result
        } catch {
            print(error.localizedDescription)
        }
    }
}
