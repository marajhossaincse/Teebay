//
//  Product.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/21/25.
//

import Foundation

struct ProductResponse: Hashable, Codable {
    let id: Int
    let seller: Int
    let title: String
    let description: String
    let categories: [String]
    let productImage: String
    let purchasePrice: String
    let rentPrice: String
    let rentOption: String
    let datePosted: String

    init(
        id: Int,
        seller: Int,
        title: String,
        description: String,
        categories: [String],
        productImage: String,
        purchasePrice: String,
        rentPrice: String,
        rentOption: String,
        datePosted: String
    ) {
        self.id = id
        self.seller = seller
        self.title = title
        self.description = description
        self.categories = categories
        self.productImage = productImage
        self.purchasePrice = purchasePrice
        self.rentPrice = rentPrice
        self.rentOption = rentOption
        self.datePosted = datePosted
    }

    enum CodingKeys: String, CodingKey {
        case id
        case seller
        case title
        case description
        case categories
        case productImage = "product_image"
        case purchasePrice = "purchase_price"
        case rentPrice = "rent_price"
        case rentOption = "rent_option"
        case datePosted = "date_posted"
    }
}
