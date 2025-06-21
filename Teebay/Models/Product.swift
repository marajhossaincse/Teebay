//
//  Product.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/21/25.
//

import Foundation

/*
 {
     "id": 2,
     "seller": 1,
     "title": "Product 2",
     "description": "This is product 2",
     "categories": [
       "electronics"
     ],
     "product_image": "http://127.0.0.1:8000/media/product_images/Mac_UlQfRJT.jpeg",
     "purchase_price": "1000.00",
     "rent_price": "100.00",
     "rent_option": "hour",
     "date_posted": "2025-06-20T19:20:48.954609Z"
   }
 */

struct Product: Codable {
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
