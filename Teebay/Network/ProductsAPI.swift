//
//  ProductsAPI.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/22/25.
//

import Foundation

enum ProductsAPI: API {
    case getProducts
    
    private var localUrl: String {
        switch self {
        case .getProducts:
            return "/api/products/"
        }
    }
    
    var url: String {
        "\(baseUrl)\(localUrl)"
    }
    
    var httpBody: Encodable? {
        switch self {
        case .getProducts:
            return nil
        }
    }
    
    var httpMethod: HttpMethod {
        switch self {
        case .getProducts: .get
        }
    }
}
