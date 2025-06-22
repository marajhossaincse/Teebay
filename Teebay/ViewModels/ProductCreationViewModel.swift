//
//  ProductCreationViewModel.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/21/25.
//

import Foundation

@MainActor
@Observable
class ProductCreationViewModel {
    var id: Int = 1
    var seller: Int = 1
    var title: String = ""
    var description: String = ""
    var categories: [String] = ["", ""]
    var productImage: String = ""
    var purchasePrice: String = ""
    var rentPrice: String = ""
    var rentOption: String = ""
    var datePosted: String = ""
}
